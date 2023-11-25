# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgbase=libar2simplified
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.1.2.1
pkgrel=1
_pkgdesc="Facade for libar2"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libar2simplified"
license=('custom:ISC')
depends=()
checkdepends=(libar2 libar2-musl)
_compiler=gcc
makedepends=(libar2 libar2-musl ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(95bc27ffd34e29cb7b4e02893f5a37a9fdc40f738fab2489a8ca36a8180a0596)

prepare () {
  cd -- "$srcdir"
  mv -- "$pkgbase" "$pkgbase-$pkgver"
}

build () {
  cd -- "$srcdir"
  cp -r -- "$pkgbase-$pkgver" "$pkgbase-$pkgver-musl"
  cd -- "$pkgbase-$pkgver"
  make PREFIX=/usr
  cd -- "../$pkgbase-$pkgver-musl"
  make PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c11"
}

check () {
  cd -- "$srcdir/$pkgbase-$pkgver"
  make check
  cd -- "../$pkgbase-$pkgver-musl"
  make CC="musl-${_compiler} -std=c11" check
}

package_libar2simplified () {
  pkgdesc="${_pkgdesc}"
  depends=(libar2)

  cd -- "$srcdir/$pkgbase-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/share"
}

package_libar2simplified-doc () {
  pkgdesc="${_pkgdesc} (documentation)"

  cd -- "$srcdir/$pkgbase-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib"
  rm -r -- "${pkgdir}/usr/include"
}

package_libar2simplified-musl () {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(libar2-musl)

  cd -- "$srcdir/$pkgbase-$pkgver-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
