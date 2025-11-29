# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1900.e8e97f1
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'mpvqt' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt6-webengine' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja' 'python')
source=('git+https://github.com/jellyfin/jellyfin-media-player.git')
sha256sums=('SKIP')

pkgver() {
  cd jellyfin-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jellyfin-media-player"
  rm -rf build
  mkdir build
  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -DCMAKE_SKIP_RPATH=1 \
    -DCHECK_FOR_UPDATES=OFF \
    -DUSE_STATIC_MPVQT=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/jellyfin-media-player"
  DESTDIR="${pkgdir}" cmake --install build
}
