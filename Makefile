# vim: ft=make ts=4 sw=4 noet

define usage

Available 'make' targets are:

all       Build and install.
build     Build only, don't install.

clean     Remove some build residue.
help      Display this text.
mrproper  Thorough cleanup.
pc        Prepare AUR commit.

endef

.PHONY:	all build clean help mrproper pc

help:
	$(info $(usage))
	@exit 0

mp := makepkg --cleanbuild --check --log

all:	clean
	$(mp) --install

build:	clean
	$(mp)

clean:
	rm -fr *.{log,zst} log*

mrproper:	clean
	rm -fr *.tar.gz pkg src

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

pc:
	updpkgsums
	shcare PKGBUILD
	make .SRCINFO
