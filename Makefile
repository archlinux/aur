all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fs

clean:
	rm -rf read-it-later/ pkg/ src/

cleanall: clean
	rm -rf read-it-later-git-*.pkg.tar.xz

devdocker:
	sudo docker build --pull -t readitlater_git -f dev.Dockerfile .

