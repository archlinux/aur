install:
	makepkg -si

uninstall:
	sudo pacman -Rs mov-cli

clean:
	rm .SRCINFO
	rm -r ./pkg
	sudo rm -r ./src
	rm ./*.pkg.tar.zst

src-info:
	makepkg --printsrcinfo > .SRCINFO

init-repo:
	git -c init.defaultBranch=master init
	git remote add aur ssh://aur@aur.archlinux.org/mov-cli.git