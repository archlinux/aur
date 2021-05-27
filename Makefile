update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
.PHONY: update

install:
	makepkg -si
.PHONY: install
