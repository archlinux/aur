build:
	makepkg --printsrcinfo > .SRCINFO

check-srcinfo-diff:
	bash -c 'diff .SRCINFO <(makepkg --printsrcinfo)'

push: check-srcinfo-diff
	git push origin master

push-aur: check-srcinfo-diff
	git remote set-url --add aur https://aur.archlinux.org/keybase-git.git/
	git push aur master
