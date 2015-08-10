# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=okteta-git
pkgver=0.17.60.r3423.9c1684d
pkgrel=1
pkgdesc="KDE hex editor for viewing and editing the raw data of files. (GIT version)"
url='https://www.kde.org/applications/utilities/okteta'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kcmutils' 'knewstuff' 'kparts' 'qca-qt5' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
provides=('okteta')
conflicts=('kdesdk-okteta' 'okteta')
replaces=('kdesdk-okteta' 'okteta')
source=('git://anongit.kde.org/okteta.git')
sha1sums=('SKIP')
install="okteta-git.install"

pkgver() {
  cd okteta
  _ver=$(grep -R QStringLiteral program/about.cpp | head -n2 | tail -n1 | cut -d '"' -f2)
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed 's|${DATA_INSTALL_DIR}|${KXMLGUI_INSTALL_DIR}|g' -i okteta/parts/kpart/CMakeLists.txt
}

build() {
  cd build
  cmake ../okteta \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
