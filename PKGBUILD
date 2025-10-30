# Maintainer: x9x

pkgname=yafu-git-gcc9
pkgver=r804.f86148e
pkgrel=1
pkgdesc="Automated integer factorization."
url=https://github.com/bbuhrow/yafu
license=("MIT")
arch=('x86_64')
conflicts=('yafu-git' 'yafu')
provides=('yafu-git-gcc9' 'yafu' 'ysieve')
makedepends=('git' 'subversion' 'gcc9')
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
    cd "$srcdir/yafu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/ytools
    make CC=gcc-9 CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
	cp libytools.a ${srcdir}/ysieve/

	cd ${srcdir}/ysieve
    make CC=gcc-9 CFLAGS="$CFLAGS -g -O3 -fomit-frame-pointer -Wall  -I.  -I../ytools -Wno-error=incompatible-pointer-types"
	cp libytools.a ${srcdir}/yafu/
	cp libysieve.a ${srcdir}/yafu/

	cd ${srcdir}/msieve
	make all NO_ZLIB=1 CC=gcc-9

	cd ${srcdir}/yafu
	make yafu CC=gcc-9 NFS=1 CFLAGS="$CFLAGS -g -m64 -std=gnu99 -DUSE_SSE2 -fno-common -DUSE_NFS -O2 -fomit-frame-pointer -Wall  -I. -Iinclude -Itop/aprcl -Itop/cmdParser -Itop/ -Ims_include/ -Ifactor/gmp-ecm   -I../ysieve -I../ytools -I../msieve/zlib -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -DVBITS=64 -Iaprcl -Ignfs/poly/stage1 -Ignfs/poly"
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
