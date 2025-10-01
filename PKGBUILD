# Maintainer: gilcu3
# Previous Maintainer: KUMAX <kumax2048@pm.me>
# Contributor: KUMAX

_pkgbase=yafu
pkgname=yafu-git
pkgrel=1
pkgver=r782.b357004
pkgdesc="Automated integer factorization."
url=https://github.com/bbuhrow/yafu
license=("MIT")
arch=('x86_64')
conflicts=(${_pkgbase})
provides=('yafu' 'ysieve')
makedepends=('git' 'subversion' 'gcc')
depends=('gmp' 'gmp-ecm')
optdepends=('ggnfs')
source=(
	"git+https://github.com/bbuhrow/yafu.git"
	"git+https://github.com/bbuhrow/ytools.git"
	"git+https://github.com/bbuhrow/ysieve.git"
	msieve::"svn+svn://svn.code.sf.net/p/msieve/code/trunk"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd ${srcdir}/yafu
	cp Makefile.gcc Makefile
	sed -i "s%^LIBS += -lecm /users/buhrow/src%#LIBS += -lecm /users/buhrow/src%" Makefile
	sed -i "s/^\#LIBS += -lecm -lgmp -lytools -lysieve/LIBS += -lecm -lgmp -lytools -lysieve/" Makefile
}

pkgver() {
	cd "${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${srcdir}/ytools
    make CC=gcc CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
	cp libytools.a ${srcdir}/ysieve/

	cd ${srcdir}/ysieve
    make CC=gcc CFLAGS="$CFLAGS -g -O3 -fomit-frame-pointer -Wall  -I.  -I../ytools -Wno-error=incompatible-pointer-types"
	cp libytools.a ${srcdir}/yafu/
	cp libysieve.a ${srcdir}/yafu/

	cd ${srcdir}/msieve
	make all NO_ZLIB=1

	cd ${srcdir}/yafu
	make yafu CC=gcc NFS=1 CFLAGS="$CFLAGS -g -m64 -std=gnu99 -DUSE_SSE2 -fno-common -DUSE_NFS -O2 -fomit-frame-pointer -Wall  -I. -Iinclude -Itop/aprcl -Itop/cmdParser -Itop/ -Ims_include/ -Ifactor/gmp-ecm   -I../ysieve -I../ytools -I../msieve/zlib -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -Wno-error=return-mismatch -DVBITS=64 -Iaprcl -Ignfs/poly/stage1 -Ignfs/poly"
}

check() {
	cd ${srcdir}/yafu
	./yafu 140870298550359924914704160737419905257747544866892632000062896476968602578482966342704
	./yafu -threads $(nproc) 2056802480868100646375721251575555494408897387375737955882170045672576386016591560879707933101909539325829251496440620798637813
}

package() {
	cd ${srcdir}/ysieve
	install -Dm755 ysieve ${pkgdir}/usr/bin/ysieve

	cd ${srcdir}/yafu
	install -Dm755 yafu ${pkgdir}/usr/bin/yafu
	install -Dm644 yafu.ini -t ${pkgdir}/etc/yafu
	install -Dm644 README -t ${pkgdir}/usr/share/doc/yafu
	install -Dm644 CHANGES -t ${pkgdir}/usr/share/doc/yafu
	install -Dm644 docfile.txt -t ${pkgdir}/usr/share/doc/yafu
}
