PREFIX ?= /usr

all:
	@echo Run \'make install\' to install fetchpac.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p fetchpac $(DESTDIR)$(PREFIX)/bin/fetchpac
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/fetchpac

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/fetchpac