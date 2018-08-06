.PHONY: prepare

prepare:
	gpg --detach-sign --yes rebuild-detector
	gpg --detach-sign --yes rebuild-detector.hook
	gpg --detach-sign --yes rebuild-detector-cleanup
	gpg --detach-sign --yes rebuild-detector-cleanup.hook
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
