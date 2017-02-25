default:

update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

.PHONY: default
