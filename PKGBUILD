# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libktorrent-git
pkgver=23.03.70.r575.0a7cf1d
pkgrel=1
pkgdesc="A BitTorrent protocol implementation. (GIT version)"
arch=('x86_64')
url='https://projects.kde.org/projects/extragear/network/libktorrent'
license=('GPL')
depends=('qca-qt5'
         'kio'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'boost'
             )
provides=('libktorrent')
conflicts=('libktorrent')
source=('git+https://invent.kde.org/network/libktorrent.git')
sha256sums=('SKIP')

pkgver() {
  cd libktorrent
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {

  cd build
  cmake ../libktorrent \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
