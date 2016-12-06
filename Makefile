VER=0.0.3-1
# Be sure to update this in PKGBUILD

build:
	if [ -d larryshell ]; then \
		cd larryshell && git pull; \
	else git clone git@github.com:Devon-Austin-Wood-Thomas/larryshell larryshell; fi
	tar cvf $(VER).tar.gz \
		larryshell/larryshell \
		larryshell/larryshellrc \
		larryshell/larryshell-errors.txt
	cp $(VER).tar.gz /srv/http/larryshell
	perl -pi -e "s/(md5sums=)\((.*)\)/\1('`md5sum $(VER).tar.gz | cut -d " " -f1`')/" PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
clean:
	rm -rf src pkg *.tar* larryshell
