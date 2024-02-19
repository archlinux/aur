PKG:=$(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

.PHONY: upload clean

all: src

clean: .SRCINFO ${PKG}.git PKGBUILD src
	rm -Rf $^

upload: .${PKG}.git .SRCINFO
	GIT_DIR=$< GIT_WORK_TREE=$(@D) git commit -a
	GIT_DIR=$< GIT_WORK_TREE=$(@D) git push origin master

.%.git:
	git clone --bare ssh://aur@aur.archlinux.org/$* $@

src: PKGBUILD
	makepkg -do

.SRCINFO: PKGBUILD
	mksrcinfo

%: %.in
	m4 $< > $*
