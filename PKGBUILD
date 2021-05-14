# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweathercore-git
pkgver=v21.05.r4.gca67d2c
pkgrel=1
pkgdesc="Library to facilitate retrieval of weather information including forecasts and alerts"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/libraries/kweathercore"
license=(GPL3)
depends=('ki18n' 'qt5-location')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('kweathercore')
conflicts=('kweathercore')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}