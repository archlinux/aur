.PHONY: PKGBUILD

all: PKGBUILD .SRCINFO

PKGBUILD:
	makepkg -doc

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO