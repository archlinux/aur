FREEBSDVER?=14.0.0

INSTALL?=/usr/bin/install
INSTALL_PROGRAM=$(INSTALL) -Dm755
INSTALL_DATA=$(INSTALL) -Dm644
bindir=/usr/bin/
man1dir=/usr/share/man/man1/
CFLAGS+= -include linux_compat.h

all: bsdsed

bsdsed: freebsd-src-release-$(FREEBSDVER)/usr.bin/sed/compile.o \
	freebsd-src-release-$(FREEBSDVER)/usr.bin/sed/main.o \
	freebsd-src-release-$(FREEBSDVER)/usr.bin/sed/misc.o \
	freebsd-src-release-$(FREEBSDVER)/usr.bin/sed/process.o \
	freebsd-src-release-$(FREEBSDVER)/lib/libc/string/strlcat.o \
	freebsd-src-release-$(FREEBSDVER)/lib/libc/string/strlcpy.o \
	errc.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o bsdsed $^

bsdsed.1:
	@sed 's/sed/bsdsed/;s/GNU bsd/GNU /' freebsd-src-release-$(FREEBSDVER)/usr.bin/sed/sed.1 > bsdsed.1
	
install: bsdsed bsdsed.1
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir) bsdsed
	$(INSTALL_DATA) -t $(DESTDIR)$(man1dir) bsdsed.1
