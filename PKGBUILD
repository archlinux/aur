# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=easyrpg-player
pkgver=0.1.2
pkgrel=2
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player-git')
makedepends=('boost' 'git')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'openal' 'libsndfile' 'expat')
install=$pkgname.install
source=(easyrpg-readers-$pkgver.tar.gz::"https://github.com/EasyRPG/Readers/archive/$pkgver.tar.gz"
        $pkgname-$pkgver.tar.gz::"https://github.com/EasyRPG/Player/archive/$pkgver.tar.gz")
sha256sums=('694c1b55c4a575ebc602e4f18736cda0ec187205f14545dc5641408427bd0d49'
            'c376d1074f9a2fd7a732b0d3d37f9f60a29e0bdb013e26b60fb9c359ac74ffed')

build () {
  # build readers
  cd Readers-$pkgver

  ./autogen.sh
  ./configure --enable-xml
  make

  # build player
  cd ../Player-$pkgver

  ./autogen.sh
  ./configure --prefix="/usr" LIBS="-lreaders -lexpat" \
    CPPFLAGS="-DUNIX -I$srcdir/Readers-$pkgver/include" \
    LDFLAGS="-L$srcdir/Readers-$pkgver/src"
  make
}

package () {
  install -Dm755 Player-$pkgver/src/$pkgname "$pkgdir"/usr/bin/$pkgname
}
