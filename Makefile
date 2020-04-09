update: PKGBUILD .SRCINFO

PKGBUILD:
	updpkgsums

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@
