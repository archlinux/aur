test: namcap build

namcap:
	namcap PKGBUILD

build:
	makepkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

release: test srcinfo
