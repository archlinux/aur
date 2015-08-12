PKG:=$(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

.PHONY: upload clean

all: PKGBUILD src

clean:
	rm -rf .SRCINFO \
	  ${PKG}.git    \
	  PKGBUILD      \
	  src

upload: .${PKG}.git .SRCINFO
	cd $<                       && \
	cp -lR ../* ../.SRCINFO ./  && \
	git commit -am 'bump'       && \
	true git push origin master

.%.git:
	git clone ssh://aur@aur.archlinux.org/$* $@

src:
	makepkg -do
	make -W PKGBUILD.in

.SRCINFO: PKGBUILD
	mksrcinfo

%: %.in
	m4 $< > $*
