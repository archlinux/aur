# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

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
sha256sums=(67f7e7d1d86df2946ee162ffe1fd61f8f6d25a4d8bf5384e91d819d8f17b9a23)

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
