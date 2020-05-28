CFLAGS_EXTRA ?= -Wall -fPIC -std=c99 -shared -O2
PREFIX ?= $(HOME)/.local
LIBDIR ?= /lib/deadbeef

build:
	$(CC) $(CFLAGS) $(CFLAGS_EXTRA) rating.c -o rating.so

clean:
	test -f rating.so && rm rating.so || true

install:
	install -d "$(DESTDIR)$(PREFIX)$(LIBDIR)"
	install "rating.so" "$(DESTDIR)$(PREFIX)$(LIBDIR)/rating.so"

uninstall:
	rm "$(DESTDIR)$(PREFIX)$(LIBDIR)/rating.so"
