.PHONY: all
all:
	makepkg -f
	$(MAKE) .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo >$@
