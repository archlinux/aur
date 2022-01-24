SFD := $(wildcard *.sfd)
BDF :=

all:

define add-bdf-font
_bdfo := $$(patsubst %.sfd,%-$$(shell fontforge -quiet -c 'print(open("$1").bitmapSizes[0])').bdf,$1)

BDF += $$(_bdfo)
$$(_bdfo): $1
	fontforge -quiet -c 'open("$1").generate("$(1:.sfd=.bdf)", bitmap_type="bdf")'

undefine _bdfo
endef

$(foreach S,$(SFD),$(eval $(call add-bdf-font,$S)))

OTB := $(patsubst %.bdf,%.otb,$(BDF))
PCF := $(patsubst %.bdf,%.pcf,$(BDF))
PCFGZ := $(patsubst %,%.gz,$(PCF))

all: $(BDF) $(OTB) $(PCFGZ)
clean:
	$(RM) $(BDF) $(OTB) $(PCF) $(PCFGZ)

%.gz: %
	gzip -9c $< > $@

%.pcf: %.bdf
	bdftopcf -o $@ $<

%.otb: %.bdf
	fonttosfnt -o $@ -- $<
