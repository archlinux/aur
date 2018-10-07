all: PKGBUILD .SRCINFO

PKGBUILD:
	sed -i '/depends=/,/)/d' $@
	./build_depends.py >> $@
	updpkgsums
	sed -i '/^$$/d' $@  # updpkgsums adds a newline

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

check: PKGBUILD
	makepkg -fc

clean:
	$(RM) *.pkg.*

.PHONY: all check clean PKGBUILD
