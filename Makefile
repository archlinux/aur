PKG:=$(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

.PHONY: upload clean

all: PKGBUILD src

clean:
	rm -rf .SRCINFO \
	  ${PKG}.git    \
	  PKGBUILD      \
	  src

upload: .${PKG}.git .SRCINFO
	rm -f .git
	ln -s $</.git .
	git commit -am 'bump'
	git push origin master
	rm .git

.%.git:
	git clone ssh://aur@aur.archlinux.org/$* $@

src:
	makepkg -do
	make -W PKGBUILD.in

.SRCINFO: PKGBUILD
	mksrcinfo

src/pvr.hts/pvr.hts/addon.xml.in: .${PKG}.git

PKGBUILD: src/pvr.hts/pvr.hts/addon.xml.in

%: %.in
	m4 $< > $*
