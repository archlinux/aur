.POSIX:

OS = $(shell uname -s)
ifndef PREFIX
	PREFIX = /usr
endif
MANPREFIX = $(PREFIX)/share/man

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f bok $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/bok
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f bok.1 $(DESTDIR)$(MANPREFIX)/man1/bok.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/bok.1
	mkdir -p $(DESTDIR)$(PREFIX)/share/bok
	chmod 755 $(DESTDIR)$(PREFIX)/share/bok
	cp -f bokrc.default $(DESTDIR)$(PREFIX)/share/bok/
	chmod 644 $(DESTDIR)$(PREFIX)/share/bok/bokrc.default
	
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/bok
	rm -f $(DESTDIR)$(MANPREFIX)/man1/bok.1
	rm -rf $(DESTDIR)$(PREFIX)/share/bok

.PHONY: install uninstall
