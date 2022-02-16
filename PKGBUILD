# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgbase=libar2
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.1
pkgrel=2
_pkgdesc="Library for the Argon2-family of hashing functions"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64)
url="https://github.com/maandree/libar2"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl libblake libblake-musl)
_compiler=gcc
makedepends=(glibc musl libblake libblake-musl ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f94e871b6e4b6a23e9019b3ff606836f05eb1ca8ec3eacd466c171cd0f0abd1a)

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

package_libar2() {
  pkgdesc="${_pkgdesc}"
  depends=(glibc libblake)

  cd -- "$srcdir/$pkgbase-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/share"
}

package_libar2-doc() {
  pkgdesc="${_pkgdesc} (documentation)"

  cd -- "$srcdir/$pkgbase-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib"
  rm -r -- "${pkgdir}/usr/include"
}

package_libar2-musl() {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(musl libblake-musl)

  cd -- "$srcdir/$pkgbase-$pkgver-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
