# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=filelight-git
pkgver=r915.7ec619e
pkgrel=1
pkgdesc="View disk usage information"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/filelight'
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
provides=('filelight')
conflicts=('filelight')
source=('git+https://invent.kde.org/utilities/filelight.git')
md5sums=('SKIP')

pkgver() {
  cd filelight
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  BUILD_TYPE=Release
  if [[ " ${OPTIONS[@]} " =~ " debug " ]]; then
    BUILD_TYPE=RelDebug
  elif [[ " ${OPTIONS[@]} " =~ " !strip " ]]; then
    BUILD_TYPE=RelDebug
  fi
  echo "${BUILD_TYPE}"

  cmake ../filelight \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
