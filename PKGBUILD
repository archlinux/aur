# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(mmixware{,-docs,-src})
pkgver=20131017
pkgrel=5
pkgdesc="MMIX assembler and simulator"
arch=('i686' 'x86_64')
url="http://mmix.cs.hm.edu/"
license=('custom')
makedepends=('texlive-core')
source=("http://mmix.cs.hm.edu/src/mmix-$pkgver.tgz"
        LICENSE)
sha256sums=('aa64c4b9dc3cf51f07b330791f8ce542b0ae8a1132e098fa95a19b31350050b4'
            '62d0fc588ebbbc531699c94860bec447a77b94fa5078787e354b1a0593bcdb75')
noextract=("mmix-${pkgver}.tgz")

prepare() {
  mkdir "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  bsdtar -xf "../mmix-$pkgver.tgz"
}

build() {
  cd "$pkgname-$pkgver"

  unset MAKEFLAGS
  make {mmixal,mmix-{arith,config,doc,io,mem,pipe,sim},mmmix,mmotype}.pdf
  make all
}

package_mmixware() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install abstime mmix mmixal mmmix mmotype "$pkgdir/usr/bin"
  install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_mmixware-docs() {
  pkgdesc="MMIX documentation"
  arch=('any')

  cd "$pkgbase-$pkgver"

  install -d "$pkgdir/usr/share/doc/$pkgbase"
  install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgbase"
}

package_mmixware-src() {
  pkgdesc="MMIX sources"
  arch=('any')

  cd "$pkgbase-$pkgver"

  install -d "$pkgdir/usr/src/$pkgbase"
  bsdtar --no-same-owner -C "$pkgdir/usr/src/$pkgbase" -xf "../mmix-$pkgver.tgz"
}
