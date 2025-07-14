# Maintainer: Ángel Navarro <lito.15[at]proton[dot]me>

pkgname=knighttime-git
pkgver=e7b8e32
pkgrel=1
pkgdesc="Helpers for scheduling the dark-light cycle"
url="https://invent.kde.org/plasma/knighttime"
depends=('extra-cmake-modules' 'gcc-libs' 'glibc' 'kconfig' 'kcoreaddons' 'kdbusaddons' 'kholidays' 'ki18n' 'qt6-base' 'qt6-positioning')
arch=('x86_64')
license=('LGPL-2.1-or-later')
makedepends=('git' 'cmake' 'gtest')
conflicts=('knighttime')
provides=('libKNightTime.so')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$pkgname"
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
