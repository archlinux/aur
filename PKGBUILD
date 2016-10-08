# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kmag-frameworks-git
pkgver=1.0.r463.b270d75
pkgrel=1
pkgdesc="A screen magnifier. KF5 Frameworks branch. (GIT version)"
url='http://kde.org/applications/utilities/kmag'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio'
         'libkdeaccessibilityclient'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('kdegraphics-kmag'
           'kmag'
           )
provides=('kmag')
source=('git://anongit.kde.org/kmag#branch=frameworks')
sha256sums=('SKIP')

pkgver() {
  cd kmag
  _ver="$(cat version.h | grep -m1 KMAG_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kmag \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
