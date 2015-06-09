pkg = cssc-1.4.0-1-x86_64.pkg.tar.xz
src = PKGBUILD
inf = .SRCINFO

all: $(inf) $(pkg)

%.tar.xz: $(src)
	makepkg -s

install: $(pkg)
	pacman -U $^

$(inf): $(src)
	mksrcinfo

check: $(src)
	namcap $^

aur: $(pkg)
	mkaurball -f

sum: $(src)
	updpkgsums

clean:
	rm -rf $(inf) *.tar.xz *.tar.gz pkg/ src/

# vim: se ts=4:
