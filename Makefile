update: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@
