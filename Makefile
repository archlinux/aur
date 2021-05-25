update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
.PHONY: update
