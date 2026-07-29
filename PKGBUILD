# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=vbcc-git
pkgver=0.9i.pre.r0.gab1caaf
pkgrel=1
pkgdesc='Portable and retargetable ISO C compiler (git version)'
arch=(x86_64)
url='https://github.com/siemens-mobile-hacks/vbcc'
license=(custom)
depends=(glibc vasm-git vlink-git)
makedepends=(git)
provides=(vbcc)
conflicts=(vbcc)
source=(git+https://github.com/siemens-mobile-hacks/vbcc.git)
sha256sums=(SKIP)

pkgver() {
	cd vbcc
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd vbcc

	local target
	for target in machines/*; do
		target=${target##*/}
		case $target in
			bi386|dv|falco16|fire16|mark|messiahtron|pm|src)
				continue
				;;
		esac

		if [[ -f machines/$target/machine.c &&
		      -f machines/$target/machine.h &&
		      -f machines/$target/machine.dt ]]; then
			make -j1 TARGET="$target" "EMUL=yes '' |" \
				CC="gcc -std=c9x $CPPFLAGS $CFLAGS -Wno-format-security -DHAVE_AOS4" \
				LDFLAGS="$LDFLAGS -lm"
		fi
	done
}

package() {
	cd vbcc
	install -d "$pkgdir/usr/bin"
	find bin -maxdepth 1 -type f ! -name '.*' -perm -u+x \
		-exec install -m755 -t "$pkgdir/usr/bin" {} +
}
