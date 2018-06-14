default: build

build: namcap
	makepkg
	mksrcinfo

namcap:
	namcap PKGBUILD

# too many failures we can't correct due to PKGBUILD design
shellcheck:
	shellcheck PKGBUILD

vet: namcap shellcheck
