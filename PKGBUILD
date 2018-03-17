# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=4.00.00
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'zlib')
makedepends=('cmake')
source=(https://github.com/team-eternity/eternity/archive/${pkgver}.tar.gz)
sha512sums=('1d78e8db65d8d2da4bea00944304ec4d6bbfab90d6ef913c1e1d64f7cbf6162284f5861e3356c501731ab3b8708e8310286f16e8430aeb50d79cfc2bd8ff7a9f')

prepare() {
  cd "eternity-${pkgver}"

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
  cmake ../eternity-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ee-build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
