# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=kongress-git
pkgver=24.04.70_r454.g1c1d73b
pkgrel=1
pkgdesc="Companion application for conferences"
arch=($CARCH)
url="https://github.com/KDE/kongress"
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc kcalendarcore-git kconfig-git kcoreaddons-git kdbusaddons-git ki18n-git kirigami-git knotifications-git qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git python)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
