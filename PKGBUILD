# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=zlib-asm
pkgver=1.2.11
pkgrel=1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP'
arch=('i686' 'x86_64')
license=('custom')
url="https://www.zlib.net/"
provides=("zlib=$pkgver")
conflicts=('zlib')
depends=('glibc')
options=('staticlibs') # needed by binutils testsuite
source=("https://zlib.net/zlib-$pkgver.tar.gz"{,.asc})
sha512sums=('73fd3fff4adeccd4894084c15ddac89890cd10ef105dd5e1835e1e9bbb6a49ff229713bd197d203edfa17c2727700fce65a2a235f07568212d820dca88b528ae'
            'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')

prepare() {
	cd ${srcdir}/zlib-$pkgver
	grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build() {
	cd ${srcdir}/zlib-$pkgver

	# use ASM optimizations
	case $CARCH in
	x86_64)
		cp contrib/gcc_gvmat64/gvmat64.S ./match.S
	;;
	i686)
		cp contrib/asm686/match.S ./match.S
	;;
	esac

	CFLAGS+=' -O3 -DASMV'

	./configure --prefix=/usr
	make OBJA=match.o PIC_OBJA=match.lo

	sed '/\*\//q' zlib.h > LICENSE
}

check() {
	cd ${srcdir}/zlib-$pkgver
	make test
}

package() {
	cd ${srcdir}/zlib-$pkgver

	make install DESTDIR=$pkgdir
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/zlib/LICENSE"
}
