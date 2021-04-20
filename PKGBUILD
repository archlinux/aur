# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1491.7b7f25b
pkgrel=2
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=('git+https://github.com/jellyfin/jellyfin-media-player.git'
        'jwc-10.7.2-2.tar.gz::https://github.com/iwalton3/jellyfin-web-jmp/releases/download/jwc-10.7.2-2/dist.zip')
sha256sums=('SKIP'
            '214e69f97ea862cbfc9c9a92ec832e6f145d9adbc2e2fb2c06940088e1c808f5')

pkgver() {
  cd jellyfin-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jellyfin-media-player"
  mkdir -p build
  cd build
  cp -r "${srcdir}/dist" .
  cmake -DCMAKE_INSTALL_PREFIX='/usr/' -DCMAKE_BUILD_TYPE='Debug' -DQTROOT=./qt -DCMAKE_SKIP_RPATH=1 ..
  make
}

package() {
  cd "${srcdir}/jellyfin-media-player/build"
  DESTDIR="${pkgdir}" make install
}
