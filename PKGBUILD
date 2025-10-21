# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=obsession-git
pkgver=109.05.alpha.r16.g135feb6
pkgrel=1
pkgdesc="A Hotline client written in Qt featuring Shift-JIS support and other stuff."
arch=('i686' 'x86_64')
url="https://github.com/tjohnman/Obsession"
depends=('qt6-base' 'qt6-multimedia')
makedepends=('patch' 'make' 'cmake')
license=('GPL3')
source=('git+https://github.com/tjohnman/Obsession.git#branch=qt6'
        'obsession.desktop')
sha256sums=('SKIP'
            '1d6692f0add24ca7e8eb246035a5ee730453505c4f2868b51ec71b6d3fa7a14c')
provides=('Obsession')
options=('!lto')

pkgver() {
  cd "Obsession"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Obsession"
  mkdir -p build
  cmake -DCMAKE_POLICY_VERSION_MINIMUM='3.5' -S . -B build
  cd build
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
