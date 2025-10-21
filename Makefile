PNGS :=

all:

include Makefile.part

all: $(PNGS)

clean:
	$(RM) $(PNGS)

define CONVERT_SVG
	rsvg-convert -w $(SIZE) -h $(SIZE) -f png -o $@ $<
endef
