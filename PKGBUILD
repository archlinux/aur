# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>

_pkgbasename=libffi
pkgname=lib32-libffi6
pkgver=3.2.1
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions (ABI version 6)"
arch=('x86_64')
url="http://sourceware.org/libffi"
license=('MIT')
depends=('glibc')
checkdepends=('dejagnu')
makedepends=('gcc-multilib')
source=(https://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha1sums=('280c265b789e041c02e5c97815793dfc283fb1e6')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  export CC="gcc -m32"
  
  ./configure --prefix=/usr --libdir=/usr/lib32 \
              --libexecdir=/usr/lib32 --disable-static \
              --enable-pax_emutramp
  make
}

check() {
  make -C $_pkgbasename-$pkgver check
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
  
  mv "$pkgdir/usr/lib32/libffi.la" "$pkgdir/usr/lib32/libffi6.la"
  rm -rf "$pkgdir/usr/lib32/$_pkgbasename-$pkgver"
  rm -f "$pkgdir/usr/lib32/libffi.so"
  rm -rf "$pkgdir/usr/lib32/pkgconfig" "$pkgdir/usr/share"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
