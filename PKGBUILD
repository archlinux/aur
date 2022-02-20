# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgbase=libblake
pkgname=($pkgbase $pkgbase-musl)
pkgver=3.0
pkgrel=1
_pkgdesc="Library for the BLAKE-family of hashing functions"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64)
url="https://github.com/maandree/libblake"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl)
_compiler=gcc
makedepends=(glibc musl ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1b2a07aa398375eb5505e156577ab8df920ded99fb4a99fbae8559207e189f03)

build() {
  cd -- "$srcdir"
  cp -r -- "$pkgbase-$pkgver" "$pkgbase-$pkgver-musl"
  cd -- "$pkgbase-$pkgver"
  make PREFIX=/usr
  cd -- "../$pkgbase-$pkgver-musl"
  make PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c11"
}

check() {
  cd -- "$srcdir/$pkgbase-$pkgver"
  make check
  cd -- "../$pkgbase-$pkgver-musl"
  make CC="musl-${_compiler} -std=c11" check
}

package_libblake() {
  pkgdesc="${_pkgdesc}"
  depends=(glibc)

  cd -- "$srcdir/$pkgbase-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

package_libblake-musl() {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(musl)

  cd -- "$srcdir/$pkgbase-$pkgver-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
}
