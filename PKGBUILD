# Maintainer: jwty <janoosh@catgirls.party>

_pkgbasename=libffi
pkgname=libffi7
pkgver=3.3
pkgrel=2
pkgdesc="Portable foreign function interface library (ABI version 7)"
arch=('x86_64')
url="http://sourceware.org/libffi"
license=('MIT')
depends=('glibc')
source=(https://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha1sums=('8df6cb570c8d6596a67d1c0773bf00650154f7aa')

prepare() {
	cd $_pkgbasename-$pkgver
	autoreconf -fiv
}

build() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	./configure \
		--prefix=/usr \
		--disable-static \
		--enable-pax_emutramp
	make
}

package() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	make DESTDIR="$pkgdir" install
  
	mv "$pkgdir/usr/lib/libffi.la" "$pkgdir/usr/lib/libffi7.la"
	rm -rf "$pkgdir/usr/lib/$_pkgbasename-$pkgver"
	rm -f "$pkgdir/usr/lib/libffi.so"
	rm -rf "$pkgdir/usr/lib/pkgconfig" "$pkgdir/usr/share"

	install -D -m644 "$pkgdir/usr/include/ffi.h" "$pkgdir/usr/include/libffi7/ffi.h"
	install -D -m644 "$pkgdir/usr/include/ffitarget.h" "$pkgdir/usr/include/libffi7/ffitarget.h"
	rm -f "$pkgdir/usr/include/ffi.h" "$pkgdir/usr/include/ffitarget.h"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
