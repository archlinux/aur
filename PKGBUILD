# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1749.95cb20f
_webver=10.8.13
pkgrel=2
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=('git+https://github.com/jellyfin/jellyfin-media-player.git'
        "jellyfin-web_${_webver}.tar.gz::https://repo.jellyfin.org/releases/server/portable/versions/stable/web/${_webver}/jellyfin-web_${_webver}_portable.tar.gz"
        "disable-update-check.patch")
sha256sums=('SKIP'
            'cbd00c3c3a56d7d17d63dc6060b5cbc011820a83cde64b7f9c93690fbac174d6'
            'add2430dec35bef4fbf028273f8492cc8a530e9f6a3c2ae4b0a33d83e743aec1')

pkgver() {
  cd jellyfin-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd jellyfin-media-player
  for patch_file in ../*.patch; do
    patch -Np1 < "${patch_file}"
  done
}

build() {
  cd "${srcdir}/jellyfin-media-player"
  mkdir -p build
  cd build
  cp -r "${srcdir}/jellyfin-web_${_webver}" dist
  cmake \
    -DCMAKE_BUILD_TYPE='Debug' \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -DCMAKE_SKIP_RPATH=1 \
    -DQTROOT=./qt \
    ..
  cmake build .
}

package() {
  cd "${srcdir}/jellyfin-media-player/build"
  DESTDIR="${pkgdir}" make install
}
