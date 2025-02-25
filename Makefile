# vim: ft=make ts=4 sw=4 noet

define usage

Available 'make' targets are:

all       Build and install.
build     Build only, don't install.
clean     Remove some build residue.
mrproper  Thorough cleanup.

help      Display this text.

endef

.PHONY:	build clean help install mrproper shc sums

help:
	$(info $(usage))
	@exit 0

sums:
	updpkgsums

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

meta:	sums .SRCINFO

clean:
	rm -fr *.log* *.zst logpipe*

mrproper:	clean
	rm -fr *.gz pkg src

mp := makepkg --cleanbuild --check --log

build:	clean
	$(mp)

all:	clean
	$(mp) --install
