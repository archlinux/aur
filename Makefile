PKG_NAME := ttf-lxgw-fasmart-gothic
AUR_GIT_URL := ssh://aur@aur.archlinux.org/${PKG_NAME}.git

.PHONY: run update aur
aur:
	git remote add origin ${AUR_GIT_URL}
	git fetch

update:
	updpkgsums # update package integrity checksum
	makepkg --printsrcinfo > .SRCINFO

run:
	env all_proxy=http://127.0.0.1:7890 makepkg -si --clean
