# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgbase=libar2
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.2.2
pkgrel=2
_pkgdesc="Library for the Argon2-family of hashing functions"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libar2"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl 'libblake>=3.0' 'libblake-musl>=3.0')
_compiler=gcc
makedepends=(glibc musl 'libblake>=3.0' 'libblake-musl>=3.0' ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(edb6cbce2ec35454b43658a33bbe256e9a46bad5c425f522de56042c1b67f9f5)

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

package_libar2() {
  pkgdesc="${_pkgdesc}"
  depends=(glibc 'libblake>=3.0')

  cd -- "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/share"
}

package_libar2-doc() {
  pkgdesc="${_pkgdesc} (documentation)"

  cd -- "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib"
  rm -r -- "${pkgdir}/usr/include"
}

package_libar2-musl() {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(musl 'libblake-musl>=3.0')

  cd -- "$srcdir/$pkgbase-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
