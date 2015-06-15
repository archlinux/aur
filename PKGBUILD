# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=balloons
pkgver=0.1.8.3
pkgrel=5
pkgdesc="Tile based platform puzzle game."
url="http://sourceforge.net/projects/balloons-ng/"
arch=('i686' 'x86_64')
depends=('sdl_ttf' 'sdl_mixer')
source=("http://downloads.sourceforge.net/$pkgname-ng/$pkgname-0.1.8-3-src.tar.gz"
        "scoreList.diff" "balloons.desktop" "HIGH.DAT")
license=('GPL')
md5sums=('afdd815a7c2e9c4c007704473f089f7e'
         '5a9c8f36cfc63721c619805f533b8121'
         'SKIP'
         'b9a6a247d322bba6c5bd4ff9427f91b8')
install="$pkgname.install"

prepare() {
  cd $pkgname-0.1.8-3

  # fix compiler error
  patch -Np0 < ../scoreList.diff

  # set folder
  sed -i 's|#define DATA_PREFIX "data|#define DATA_PREFIX "/usr/share/balloons|' src/main.h
}

build() {
  cd $pkgname-0.1.8-3

  LIBS="$LIBS $(sdl-config --libs)" \
  CXXFLAGS="$CXXFLAGS $(sdl-config --cflags)" \
    ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-0.1.8-3

  make DESTDIR="$pkgdir/" install

  install -D ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D ../HIGH.DAT "$pkgdir"/usr/share/$pkgname/data/HIGH.DAT
}
