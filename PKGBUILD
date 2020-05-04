# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=zlib-asm
pkgname=(zlib-asm minizip-asm)
pkgver=1.2.11
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')
url="https://www.zlib.net/"
provides=("zlib=$pkgver" "minizip=$pkgver")
conflicts=('zlib' 'minizip')
depends=('glibc')
options=('staticlibs') # needed by binutils testsuite
source=("https://zlib.net/zlib-${pkgver}.tar.gz"{,.asc})
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

	cd contrib/minizip
	cp Makefile Makefile.orig
	cp ../README.contrib readme.txt
	autoreconf --install
	./configure --prefix=/usr --enable-static=no
	make
}

check() {
	cd ${srcdir}/zlib-$pkgver
	make test

	cd contrib/minzip
	make -f Makefile.orig test
}

package_zlib-asm() {
	pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP'

	cd ${srcdir}/zlib-$pkgver
	make install DESTDIR=${pkgdir}
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zlib/LICENSE"
}

package_minizip-asm() {
	pkgdesc='Mini zip and unzip based on zlib'
	depends=('zlib-asm')

	cd ${srcdir}/zlib-$pkgver/contrib/minizip
	make install DESTDIR=${pkgdir}
	install -D -m644 ${srcdir}/zlib-$pkgver/LICENSE ${pkgdir}/usr/share/licenses/minizip/LICENSE

	# https://github.com/madler/zlib/pull/229
	rm ${pkgdir}/usr/include/minizip/crypt.h
}
