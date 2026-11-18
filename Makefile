PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share/sbxkb
PKG_CONFIG ?= pkg-config
CC ?= cc
CFLAGS ?= -O2 -g
CPPFLAGS += -DSBXKB_DATA_DIR='"$(DATADIR)"' $(shell $(PKG_CONFIG) --cflags x11 libpng)
CFLAGS += -std=c11 -Wall -Wextra -Wpedantic
LDLIBS += $(shell $(PKG_CONFIG) --libs x11 libpng)

.PHONY: all clean install uninstall check
all: sbxkb
sbxkb: main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS)

install: sbxkb
	install -d $(DESTDIR)$(BINDIR) $(DESTDIR)$(DATADIR)
	install -m755 sbxkb $(DESTDIR)$(BINDIR)/sbxkb
	install -m644 images/*.png $(DESTDIR)$(DATADIR)/
	install -m644 images/README $(DESTDIR)$(DATADIR)/FLAGS-LICENSE

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/sbxkb
	rm -f $(DESTDIR)$(DATADIR)/*.png $(DESTDIR)$(DATADIR)/FLAGS-LICENSE
	rmdir $(DESTDIR)$(DATADIR)

tests/test_sbxkb: tests/test_sbxkb.c main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS)

check: sbxkb tests/test_sbxkb
	./tests/run.sh

clean:
	rm -f sbxkb tests/test_sbxkb
