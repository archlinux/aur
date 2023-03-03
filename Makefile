
.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO


prepare: .SRCINFO
