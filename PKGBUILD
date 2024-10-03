# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=obsession-git
pkgver=109.04.alpha.r3.gffc8a99
pkgrel=2
pkgdesc="A Hotline client written in Qt featuring Shift-JIS support and other stuff."
arch=('i686' 'x86_64')
url="https://github.com/tjohnman/Obsession"
depends=('qt5-base' 'qt5-multimedia')
makedepends=('patch' 'make')
license=('GPL3')
source=('git+https://github.com/tjohnman/Obsession.git'
        'qt5.patch'
        'obsession.desktop')
sha256sums=('SKIP'
            '440b8f412e38cb1b05609dc1b0fb9cc7af4994ab614dc8971ecaa8eeedb81d9d'
            '1d6692f0add24ca7e8eb246035a5ee730453505c4f2868b51ec71b6d3fa7a14c')
provides=('Obsession')

pkgver() {
  cd "Obsession"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Obsession"
  patch -p1 < "$srcdir/qt5.patch"
  mkdir -p build
  cd build
  qmake -config release ../Obsession.pro
  make
}

package() {
  cd "$srcdir/Obsession"

  install -Dm 644 "$srcdir/obsession.desktop" "$pkgdir/usr/share/applications/obsession.desktop"
  install -Dm 644 resources/interfaceIcons/hotline.png "$pkgdir/usr/share/pixmaps/obsession.png"
  install -Dm 755 build/Obsession "$pkgdir/usr/bin/Obsession"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-*}"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname%-*}"
}
