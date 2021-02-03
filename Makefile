PREFIX ?= /usr/local
DOCDIR ?= $(PREFIX)/share/passtools/doc

all:
	@echo Run \'make install\' to install passtools
	@echo Run \'make uninstall\' to uninstall passtools

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p main.py $(DESTDIR)$(PREFIX)/bin/passtools
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@cp -p README.md $(DESTDIR)$(DOCDIR)
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/passtools

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/passtools
	@rm -rf $(DESTDIR)$(DOCDIR)
