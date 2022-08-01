all:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fs

clean:
	rm -rf guayadeque/ pkg/ src/

cleanall: clean
	rm -rf guayadeque-git-*.pkg.tar.xz guayadeque-git-*.pkg.tar.zst

docker:
	sudo docker build --pull -t guayadeque_git .

devdocker:
	sudo docker build --pull -t guayadeque_git -f dev.Dockerfile .

