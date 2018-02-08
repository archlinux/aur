all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

test:
	makepkg -sf
	namcap lm4flash-git-*.pkg*

.PHONY: all clean test
