# updpkgsums - pacman-contrib

.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO


prepare: .SRCINFO
