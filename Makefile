
all: buddypress-nb_NO.mo buddypress-nn_NO.mo

%.mo: %.po
	msgfmt $< -o $@



# Apertium + pomtrans goals, not covered by regular "make":
mt/%.po: buddypress-%_NO.po
	mkdir -p mt
	cp -f $< $@

mt-nb-nn: mt/nn.po mt/nb.po
	cd mt
	pomtrans -s nb -t nn -p nn.:nb. -M nb-nn_a-cp -T /usr/local/bin/apertium apertium nn.po

mt-nn-nb: mt/nb.po mt/nn.po
	cd mt
	pomtrans -s nn -t nb -p nb.:nn. -M nn-nb      -T /usr/local/bin/apertium apertium nb.po
