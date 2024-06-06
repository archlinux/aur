# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1789.1ca6cb8
_webver=10.9.6
pkgrel=5
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=('git+https://github.com/jellyfin/jellyfin-media-player.git'
        "jellyfin_${_webver}.tar.xz::https://repo.jellyfin.org/files/server/portable/stable/v${_webver}/any/jellyfin_${_webver}.tar.xz"
        "disable-update-check.patch")
sha256sums=('SKIP'
            '471316adf7a58b4d7c904efaa78baa267ff9294f3842a345c6be53619b3575b9'
            '23727ef8f727ac17af228f29aa5508230caac9d02f37d6c12908fcf50d4f382a')

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
  cp -r "${srcdir}/jellyfin/jellyfin-web" build/dist
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
