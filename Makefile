.PHONY: sums check

all: sums .SRCINFO check

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo >$@

check:
	namcap PKGBUILD

sums:
	updpkgsums
