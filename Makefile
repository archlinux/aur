VER=0.0.3-1
# Be sure to update this in PKGBUILD

build:
	if [ -d upstream ]; then cd upstream && git pull; else git clone git@github.com:Devon-Austin-Wood-Thomas/larryshell upstream && cd upstream; fi
	tar cvf $(VER).tar.gz \
		upstream/larryshell \
		upstream/larryshellrc \
		upstream/larryshell-errors.txt
	cp $(VER).tar.gz /srv/http/larryshell
	perl -pi -e "s/(md5sums=)\((.*)\)/\1('`md5sum $(VER).tar.gz | cut -d " " -f1`')/" PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
clean:
	rm -r src pkg *.tar*
