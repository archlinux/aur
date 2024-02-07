# Maintainer: Aaron Cottle <aaron@aaroncottle.au>

pkgname=plasma-activities-stats-git
pkgver=6.0.80_r486.g5f7ec2d
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='A library for accessing the usage data collected by the activities system'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities-git
         kconfig
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-doc
             qt6-tools)
conflicts=(kactivities-stats kactivities-stats-git)
provides=(kactivities-stats kactivities-stats-git)
source=(git://invent.kde.org/plasma/plasma-activities-stats.git)
sha256sums=('SKIP')

pkgver() {
  cd plasma-activities-stats
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S plasma-activities-stats \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
