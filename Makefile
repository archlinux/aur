PKG:=$(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

.PHONY: upload clean

all: PKGBUILD src

clean:
	rm -rf .SRCINFO \
	  ${PKG}.git    \
	  PKGBUILD      \
	  src

upload: export GIT_DIR=.${PKG}.git
upload: export GIT_WORK_TREE=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
upload: .${PKG}.git .SRCINFO
	git commit -am 'bump'
	git push origin master

.%.git:
	git clone --bare ssh://aur@aur.archlinux.org/$* $@

src: PKGBUILD
	makepkg -do

.SRCINFO: PKGBUILD
	mksrcinfo

src/pvr.hts/pvr.hts/addon.xml.in: .${PKG}.git

PKGBUILD: src/pvr.hts/pvr.hts/addon.xml.in

%: %.in
	m4 $< > $*
