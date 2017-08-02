# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=3.42.03
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
source=(https://github.com/team-eternity/eternity/archive/$pkgver.tar.gz)
sha512sums=('d1c71c018e25e33c8641d357bb32b83e9e6ef582f07e649025635f0fcd4eab7fa5de9df169529be0026c2cef3d57a6de94fe971228ba5634b3b6834d4770b9a3')

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
