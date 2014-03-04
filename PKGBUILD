# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=easyrpg-player
pkgver=0.1.2
pkgrel=3
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
makedepends=('boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'openal' 'libsndfile' 'expat')
install=$pkgname.install
source=(liblcf-$pkgver.tar.gz::"https://github.com/EasyRPG/liblcf/archive/$pkgver.tar.gz"
        $pkgname-$pkgver.tar.gz::"https://github.com/EasyRPG/Player/archive/$pkgver.tar.gz")
sha256sums=('d90d2ea4366e5a0fb21e79404b322f069520366d5199e87fc9b5f3d0bc79b337'
            'c376d1074f9a2fd7a732b0d3d37f9f60a29e0bdb013e26b60fb9c359ac74ffed')

build () {
  # build readers library
  cd liblcf-$pkgver

  ./autogen.sh
  ./configure --enable-xml
  make

  # build player
  cd ../Player-$pkgver

  ./autogen.sh
  ./configure --prefix="/usr" LIBS="-lreaders -lexpat" \
    CPPFLAGS="-DUNIX -I$srcdir/liblcf-$pkgver/include" \
    LDFLAGS="-L$srcdir/liblcf-$pkgver/src"
  make
}

package () {
  install -Dm755 Player-$pkgver/src/$pkgname "$pkgdir"/usr/bin/$pkgname
}
