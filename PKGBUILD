# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather-git
pkgver=0.4.r39.g19bcec1
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons knotifications kirigami2 kdbusaddons plasma-framework)
makedepends=(git cmake extra-cmake-modules)
provides=(kweather)
conflicts=(kweather)
source=("git+https://invent.kde.org/plasma-mobile/kweather.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
