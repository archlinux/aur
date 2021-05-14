# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-phonebook-git
pkgver=v21.05.r14.g5124e5d
pkgrel=1
pkgdesc="Phone book for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-phonebook"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kpeople' 'kcontacts' 'kpeoplevcard' 'kirigami2')
makedepends=('git' 'extra-cmake-modules' 'qt5-svg' 'qt5-tools')
provides=('plasma-phonebook')
conflicts=('plasma-phonebook' 'plasma-mobile-phonebook')
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