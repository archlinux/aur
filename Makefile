.PHONY: prepare

prepare:
	updpkgsums
	gpg --detach-sign --yes zz_snap-pac-grub-post.hook
	gpg --detach-sign --yes PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
