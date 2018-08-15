.PHONY: prepare

prepare:
	gpg --detach-sign --yes rebuild-detector
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
