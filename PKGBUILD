# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=obsession-git
pkgver=109.05.alpha.r0.g1f0c0a3
pkgrel=3
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
            'e81f88718796660d05489397a8008ca343d7445107b71453101ca9ca55529c8e'
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
