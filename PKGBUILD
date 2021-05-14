# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=daykountdown-git
pkgver=r210.ee58447
pkgrel=1
pkgdesc="A simple date countdown app written for KDE Plasma, using Kirigami."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/daykountdown"
license=(GPL3)
depends=('ki18n' 'kconfig' 'kcoreaddons' 'kwidgetsaddons' 'kirigami2' 'kio')
makedepends=('git' 'extra-cmake-modules' 'qt5-svg' 'qt5-tools')
provides=(daykountdown)
conflicts=(daykountdown)
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