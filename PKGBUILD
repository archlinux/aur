# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Arthur Titeica <arthur dot titeica at gmail dot com>

pkgname=ttfautohint
pkgver=1.8.2
pkgrel=1
pkgdesc="Provides automated hinting process for web fonts."
arch=('i686' 'x86_64')
url="http://www.freetype.org/ttfautohint/"
license=('GPL' 'custom')
depends=('freetype2' 'qt5-base' 'noto-fonts' 'noto-fonts-alpha')
optdepends=('texlive-bin: generate docs'
            'pandoc: generate docs'
            'ghc: pandoc filter')
source=(https://download.savannah.gnu.org/releases/freetype/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('386741701596a8b2d5fb744901922ed2bd740490f7e6c81e5d7e83ac677889a7'
            'SKIP')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export QMAKE='/usr/bin/qmake'
  export MOC='/usr/bin/moc'
  export UIC='/usr/bin/uic'
  export RCC='/usr/bin/rcc'
  export TTFONTS='/usr/share/fonts/noto'
  ./configure --prefix=/usr --with-qt=/usr/lib/qt \
    --with-freetype-config="pkg-config freetype2"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 FTL.TXT "${pkgdir}/usr/share/licenses/${pkgname}/FTL.TXT"
}
