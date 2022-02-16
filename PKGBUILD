# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgbase=libblake
pkgname=($pkgbase $pkgbase-musl)
pkgver=1.0
pkgrel=2
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
sha256sums=(4e435aba4f4edef18a1e09b3c20f4618daaa8c9cc4057e3136199ab91c1ba8eb)

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
