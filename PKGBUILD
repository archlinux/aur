pkgname=plex-media-player-git
pkgver=r1176.9fb08e6
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
provides=('plex-media-player')
conflicts=('plex-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-pmp-webengine' 'qt5-pmp-x11extras' 'qt5-pmp-quickcontrols')
optdepends=('xorg-xinit: for running plex as a service')
makedepends=('cmake' 'git')
source=('git+https://github.com/plexinc/plex-media-player.git'
        'plex-media-player.desktop')
sha256sums=('SKIP'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6')

pkgver() {
  cd plex-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/plex-media-player/build"
}

build() {
  cd "${srcdir}/plex-media-player/build"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT='/opt/qt5-pmp/usr' -DLINUX_X11POWER=on ..
  make
}

package() {
  cd "${srcdir}/plex-media-player/build"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "${srcdir}/plex-media-player.desktop" "${pkgdir}/usr/share/applications/plex-media-player.desktop"
}
