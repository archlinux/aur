# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=plex-media-player-git
pkgver=r1302.e74d341
pkgrel=2
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
provides=('plex-media-player')
conflicts=('plex-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=('git+https://github.com/plexinc/plex-media-player.git'
        'qt5.14.patch')
sha256sums=('SKIP'
            '9f4416f434103947672000b0172cb8875efa57b73a580c1d3fde9a35b7cc729f')

pkgver() {
  cd plex-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/plex-media-player/build"

  # This hack is to fix the build error on qt 5.14. It's probably the worst way
  # to fix it so hopefully it's fixed upstream soon.
  cd "${srcdir}/plex-media-player"
  git apply ../qt5.14.patch
}

build() {
  cd "${srcdir}/plex-media-player/build"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT='/usr' ..
  make
}

package() {
  cd "${srcdir}/plex-media-player/build"
  DESTDIR="${pkgdir}" make install
}
