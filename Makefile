.PHONY: prepare

prepare:
	gpg --detach-sign --yes checkrebuild
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
