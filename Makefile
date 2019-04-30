.SUFFIXES:

srcinfo: .SRCINFO
.PHONY: srcinfo

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@
