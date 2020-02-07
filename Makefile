.PHONY: PKGBUILD

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -oc

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO