# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=nixieclock
pkgver=1.66
pkgrel=1
pkgdesc="Simple little desktop clock that displays date and time using nixie tube digits"
arch=('i686' 'x86_64')
url="https://github.com/erco77/nixieclock"
license=('GPLv2')
depends=('fltk')
makedepends=("perl") # for pod2man
source=("https://github.com/erco77/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop"
        "nixieclock-icon.png")
sha256sums=('bdf80d41828f96952af853700ec98163bb899cf3ce603afda51785d87542c18e'
            '22104d05a441ad0d68e047faa4312e136b60c3fe59f6228a234664dcdd145bfc'
            '2f18e18d4204a59279e80a990bbd5c8a88126cc1777b4dc0616f02746d501563')

prepare() {
  sed -e 's|FLTK_DIR=/usr/local/src/fltk-1.3.x-svn|FLTK_DIR=/usr/bin|' \
      -e 's|--ldstaticflags|--ldflags --libs|' \
      -i $pkgname-$pkgver/Makefile
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -m755 nixie-text-viewer "$pkgdir"/usr/bin
  install -Dm644 docs/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 $srcdir/$pkgname-icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
