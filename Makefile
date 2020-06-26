.PHONY: update
update:
	makepkg -g >> PKGBUILD

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO
