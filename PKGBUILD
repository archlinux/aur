# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kmpcore-git
pkgver=1.2.1.r1.1ef6fa8
pkgrel=1
pkgdesc="Library for managing partitions. Common code for KDE Partition Manager and other projects."
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/kdepartitionmanager/'
license=('GPL2')
depends=('parted' 'kio')
conflicts=('kmpcore')
provides=('kmpcore')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'kdoctools' 'python')
source=('git://anongit.kde.org/kpmcore.git')
sha1sums=('SKIP')

pkgver() {
  cd kpmcore
  _ver="$(cat CMakeLists.txt | grep -e VERSION_MAJOR -e VERSION_MINOR -e VERSION_RELEASE | head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kpmcore \
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