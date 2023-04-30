
.SRCINFO: PKGBUILD

.PHONY: all update-srcinfo check

all: check update-srcinfo

update-srcinfo: .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

check: PKGBUILD
	namcap PKGBUILD

