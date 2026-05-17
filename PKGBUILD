# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgbase=libblake
pkgname=($pkgbase $pkgbase-musl)
pkgver=3.0.2
pkgrel=1
_pkgdesc="Library for the BLAKE-family of hashing functions"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libblake"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl)
_compiler=gcc
makedepends=(glibc musl ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6eed8a37b78e99d24f18e3779533edbfc236b36ab8cbe9d97463986e9ac02adf)

build() {
  cd -- "$srcdir"
  cp -r -- "$pkgbase" "$pkgbase-musl"
  cd -- "$pkgbase"
  make PREFIX=/usr
  cd -- "../$pkgbase-musl"
  make PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c11"
}

check() {
  cd -- "$srcdir/$pkgbase"
  make check
  cd -- "../$pkgbase-musl"
  make CC="musl-${_compiler} -std=c11" check
}

package_libblake() {
  pkgdesc="${_pkgdesc}"
  depends=(glibc)

  cd -- "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

package_libblake-musl() {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(musl)

  cd -- "$srcdir/$pkgbase-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
}
