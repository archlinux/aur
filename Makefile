all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fs

clean:
	rm -rf readitlater/ pkg/ src/

cleanall: clean
	rm -rf readitlater-git-*.pkg.tar.xz

devdocker:
	sudo docker build --pull -t readitlater_git -f dev.Dockerfile .

