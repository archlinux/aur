# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=phonon-qt5-mpv-git
pkgver=0.0.7.1.g9a85c5e
pkgrel=1
pkgdesc="Phonon Backend using MPV Player. (GIT version)"
arch=('x86_64')
url='https://github.com/OpenProgger/phonon-mpv'
license=('GPL')
depends=('libmpv.so'
         'phonon-qt5'
         'qt5-x11extras'
         )
makedepends=('extra-cmake-modules'
             'git'
             'qt5-tools'
             )
provides=('phonon-qt5-backend')
conflicts=('phonon-qt5-mpv')
replaces=('phonon-qt5-mpv')
source=('git+https://github.com/OpenProgger/phonon-mpv.git')
sha256sums=('SKIP')

pkgver() {
  cd phonon-mpv
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  sed -e '/mpv_opengl_init_params/s/nullptr,//g' -i phonon-mpv/src/video/videowidget.cpp
}

build() {
  cmake -S phonon-mpv -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_SKIP_RPATH=ON

  cmake --build build
}


package () {
  DESTDIR="${pkgdir}" cmake --install build
}
