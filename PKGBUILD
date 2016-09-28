# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=3.40.46
pkgrel=5
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
source=(https://github.com/team-eternity/eternity/archive/$pkgver.tar.gz
        0001-Fix-wrong-Freedoom-IWAD-detection-fixes-7.patch)
sha256sums=('6479c127bdc1986421d0daa821131d21bd3d95621c4181d3528f1efe14c0084b'
            'f708c5838e7415e21e0ba4e7c1c01305dca5854f65159989e1fdb06c6f5d9658')

prepare() {
  cd "eternity-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  # Cannot do in-tree build.
  mkdir "ee-build"
  cd "ee-build"
  cmake ../eternity-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ee-build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
