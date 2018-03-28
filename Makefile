all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

test:
	makepkg -sf
	namcap archc-git-*.pkg*

.PHONY: all clean test
