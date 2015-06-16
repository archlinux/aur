# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kcalc-git
pkgver=2.13.r1150.5c5414b
pkgrel=1
pkgdesc="Scientific Calculator. (GIT version)"
url='https://www.kde.org/applications/utilities/kcalc'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kxmlgui' 'knotifications')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kcalc' 'kdeutils-kcalc')
provides=('kcalc')
source=('git://anongit.kde.org/kcalc.git')
sha1sums=('SKIP')
install=kcalc-git.install

pkgver() {
  cd kcalc
  _ver="$(cat version.h | grep -m1 'define KCALCVERSION' | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcalc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
