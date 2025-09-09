all: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@
