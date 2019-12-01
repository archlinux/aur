aur : .SRCINFO

.SRCINFO : PKGBUILD
	sed -i "s/^sha[0-9]*sums=.*$$/$$(makepkg -gf)/" $<
	makepkg --printsrcinfo > .SRCINFO

build :
	makepkg -sr

all : aur build

clean :
	rm -rf pkg src

.PHONY: all aur build clean
