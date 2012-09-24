# $Id: PKGBUILD 70251 2012-05-03 08:40:13Z pschmitz $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=zlib
pkgname=libx32-$_pkgbasename
pkgver=1.2.7
pkgrel=1.1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (x32 ABI)'
arch=('x86_64')
license=('custom')
url="http://www.zlib.net/"
depends=('libx32-glibc' "$_pkgbasename")
makedepends=('gcc-multilib-x32')
source=("http://zlib.net/current/zlib-${pkgver}.tar.gz")
md5sums=('60df6a37c56e7c1366cca812414f7b85')

build() {
	export CC="gcc -mx32"
	export CXX="g++ -mx32"
	export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

	cd ${srcdir}/zlib-$pkgver
	./configure --prefix=/usr \
		--libdir=/usr/libx32
	make
}

check() {
	cd ${srcdir}/zlib-$pkgver
	make test
}

package() {
	cd ${srcdir}/zlib-$pkgver
	make install DESTDIR=${pkgdir}

	rm -rf "${pkgdir}"/usr/{include,share,bin}
	mkdir -p "$pkgdir/usr/share/licenses"
	ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
