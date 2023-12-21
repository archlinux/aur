PKG_NAME := cyber-bin
AUR_GIT_URL := ssh://aur@aur.archlinux.org/${PKG_NAME}.git

.PHONY: all aur update build run
all:
	@echo commands:
	@echo "   " aur		: Connect to AUR. Afterward you can run \'git push -u origin master\' to actually create a AUR repo.
	@echo "   " update	: update checksum and SRCINFO
	@echo "   " build   : forece build package
	@echo "   " install : install package on local machine

aur:
	git remote add origin ${AUR_GIT_URL}
	git branch -m master # make sure the main branch is 'master' branch(currently AUR only accept this)
	git fetch

update: SHELL:=/bin/bash
update:
	makepkg --printsrcinfo > .SRCINFO # .SRCINFO must exists in all the commits
# if there are at least one commit, delete those file not in git index ()
# if you want to add files, manually add file to git using `git add`
	@([[ $$(git ls-files) ]] && git clean -xdf ) || ( echo Please make your first stage or commit to ensure which files will not be deleted as cache files first && exit 1 )
	env all_proxy=http://127.0.0.1:7890 updpkgsums # update package integrity checksum

build: update
	env all_proxy=http://127.0.0.1:7890 makepkg -sf

install: update
	env all_proxy=http://127.0.0.1:7890 makepkg -si --clean
