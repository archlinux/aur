all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

test:
	makepkg -f

.PHONY: test
