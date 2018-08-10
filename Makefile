.PHONY: prepare

prepare:
	gpg --detach-sign --yes rebuild-detector
	gpg --detach-sign --yes rebuild-detector.hook
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
