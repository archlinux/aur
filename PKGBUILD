# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgbase=libar2
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.2.4
pkgrel=1
_pkgdesc="Library for the Argon2-family of hashing functions"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libar2"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl 'libblake>=3.0' 'libblake-musl>=3.0')
_compiler=gcc
makedepends=(glibc musl 'libblake>=3.0' 'libblake-musl>=3.0' ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(28421732a88da43052d29be846140f2ca3cfb3088b639f618654e0ed67501ac2)

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
