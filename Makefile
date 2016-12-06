VER=0.0.2-1
# Be sure to update this in PKGBUILD

build:
	tar cvf $(VER).tar.gz larryshell larryshellrc larryshell-errors.txt
	md5sum $(VER).tar.gz
	cp $(VER).tar.gz /srv/http/larryshell
	makepkg --printsrcinfo > .SRCINFO
clean:
	rm -r src pkg *.tar*
