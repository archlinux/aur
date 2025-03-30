# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1843.68ddf01
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=('git+https://github.com/jellyfin/jellyfin-media-player.git'
        "disable-update-check.patch"
        "fix-cmake-4.patch")
sha256sums=('SKIP'
            '23727ef8f727ac17af228f29aa5508230caac9d02f37d6c12908fcf50d4f382a'
            '7ff8a15d9e9a7bc9a75bc9f0ee730408827827f6f6d564686ac9f9ca26525342')

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
  rm -rf build
  mkdir build
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE='Debug' \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -DCMAKE_SKIP_RPATH=1 \
    -DQTROOT=build/qt \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/jellyfin-media-player"
  DESTDIR="${pkgdir}" cmake --install build
}
