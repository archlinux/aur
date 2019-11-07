build:
	makepkg --printsrcinfo > .SRCINFO

check-srcinfo-diff:
	bash -c 'diff .SRCINFO <(makepkg --printsrcinfo)'

push: check-srcinfo-diff
	git push origin master

push-aur: check-srcinfo-diff
	git push aur master
