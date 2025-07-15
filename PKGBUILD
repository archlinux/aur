# Maintainer: Ángel Navarro <lito.15[at]proton[dot]me>

pkgname=plasma-keyboard-git
pkgver=0edb3bd
pkgrel=1
pkgdesc="Virtual Keyboard for Qt based desktops"
url="https://invent.kde.org/plasma/plasma-keyboard"
depends=('extra-cmake-modules' 'gcc-libs' 'glibc' 'kconfig' 'kcmutils' 'kcoreaddons' 'ki18n' 'kirigami-addons' 'kirigami' 'libxkbcommon' 'qt6-base' 'qt6-declarative' 'qt6-virtualkeyboard' 'qt6-wayland' 'wayland' 'wayland-protocols')
arch=('x86_64')
license=('LGPL-2.1-or-later')
makedepends=('git' 'cmake' 'gtest')
conflicts=('plasma-keyboard')
# provides=('')
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
