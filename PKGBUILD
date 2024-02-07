# Maintainer: Aaron Cottle <aaron@aaroncottle.au>

pkgname=plasma-activities-git
pkgver=6.0.80_r1477.gbe3dd91c
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Core components for KDE Activities'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         qt6-base)
makedepends=(boost
             doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-doc
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
conflicts=(kactivities kactivities-git)
replaces=(kactivities kactivities-git)
source=(git://invent.kde.org/plasma/plasma-activities.git)
sha256sums=('SKIP')

pkgver() {
  cd plasma-activities
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S plasma-activities \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
