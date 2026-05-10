# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgbase=libar2simplified
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.1.4
pkgrel=1
_pkgdesc="Facade for libar2"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libar2simplified"
license=('custom:ISC')
depends=()
checkdepends=(libar2 libar2-musl)
_compiler=gcc
makedepends=(libar2 libar2-musl ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b748905ebcb9b3f05dbc0efb5af3dd3b9b52377095f79967344196d11d5ae971)

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
