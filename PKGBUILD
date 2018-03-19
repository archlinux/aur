pkgname=plex-media-player-git
pkgver=r1156.23446a8
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
provides=('plex-media-player')
conflicts=('plex-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine<5.11' 'qt5-x11extras<5.11' 'qt5-quickcontrols<5.11')
optdepends=('xorg-xinit: for running plex as a service')
makedepends=('cmake' 'git')
source=('git+https://github.com/plexinc/plex-media-player.git'
        'plex-media-player.desktop'
        'plexmediaplayer@.service')
sha256sums=('SKIP'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6'
            '000807fe3fefa565844a41304678d5e5f767b54f32ec3b21f41401a29a4ceefc')

pkgver() {
  cd plex-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/plex-media-player/build"
}

build() {
  cd "${srcdir}/plex-media-player/build"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 -DQTROOT='/usr/share/qt' ..
  make
}

package() {
  cd "${srcdir}/plex-media-player/build"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "${srcdir}/plex-media-player.desktop" "${pkgdir}/usr/share/applications/plex-media-player.desktop"
  install -Dm644 "${srcdir}/plexmediaplayer@.service" "${pkgdir}/usr/lib/systemd/system/plexmediaplayer@.service"
}
