PKG_NAME := ttf-lxgw-neo-xihei-screen
AUR_GIT_URL := ssh://aur@aur.archlinux.org/${PKG_NAME}.git

.PHONY: all run update aur
all:
	@echo commands:
	@echo "   " aur    : Connect to AUR. Afterward you can run \'git push -u origin master\' to actually create a AUR repo.
	@echo "   " update : update checksum and SRCINFO
	@echo "   " run    : local test

aur:
	git remote add origin ${AUR_GIT_URL}
	git fetch
    # afterward

update:
	env all_proxy=http://127.0.0.1:7890 updpkgsums # update package integrity checksum
	makepkg --printsrcinfo > .SRCINFO

run:
	env all_proxy=http://127.0.0.1:7890 makepkg -si --clean
