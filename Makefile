PKG:=$(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

.PHONY: upload clean

all: PKGBUILD src

clean:
	rm -rf .SRCINFO \
	  ${PKG}.git    \
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

.SRCINFO: PKGBUILD
	mksrcinfo

%: %.in
	m4 $< > $*
