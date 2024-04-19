all: .SRCINFO

check:
	makepkg -s
	namcap PKGBUILD

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

