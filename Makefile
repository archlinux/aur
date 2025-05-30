
all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

.PHONY: integrity
integrity:
	makepkg -g >> PKGBUILD
