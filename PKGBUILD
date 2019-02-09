# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=liquidwar
pkgver=5.6.5
pkgrel=1
pkgdesc="A unique multiplayer wargame"
arch=('i686' 'x86_64')
url="https://www.ufoot.org/liquidwar/"
license=('GPL')
depends=('allegro4')
makedepends=('python2')
source=("http://www.ufoot.org/download/$pkgname/v5/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('dad0aa84dd416cad055421ed9b40df39efae78d3df759c0583c64c54f7f2ff5f')

prepare() {
  cd $pkgname-$pkgver

  sed 's|EFENCE_LIBRARY)$|& -lm|g' -i src/Makefile.in
  sed 's|python |python2 |g' -i doc/Makefile.in
}

build() {
  cd $pkgname-$pkgver
  [[ "$CARCH" != "i686" ]] && EXTRAOPTS="--disable-asm"
  PYTHON=yes ./configure --prefix=/usr $EXTRAOPTS
  make GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" \
    GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar install_nolink
}
