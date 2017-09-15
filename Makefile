check:
	namcap PKGBUILD

build:
	makepkg -sri

srcinfo: 
	makepkg --printsrcinfo > .SRCINFO
