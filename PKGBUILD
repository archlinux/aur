# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kpmcore-git
pkgver=1.9.50.r64.9d77168
pkgrel=1
pkgdesc="Library for managing partitions. Common code for KDE Partition Manager and other projects. (GIT version)"
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/kdepartitionmanager'
license=('GPL2')
depends=('parted'
         'kio'
         )
conflicts=('kpmcore')
provides=('kpmcore')
makedepends=('extra-cmake-modules' 'git' 'python')
source=('git://anongit.kde.org/kpmcore.git')
sha1sums=('SKIP')

pkgver() {
  cd kpmcore
  _ver="$(cat CMakeLists.txt | grep -m3 -e VERSION_MAJOR -e VERSION_MINOR -e VERSION_RELEASE | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
