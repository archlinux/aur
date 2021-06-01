build:.PHONY
	makepkg -src
.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
