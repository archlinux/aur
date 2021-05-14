# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish-git
pkgver=v21.05.r6.g3e11c22
pkgrel=1
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'qt5-feedback' 'purpose' 'kirigami2' 'ki18n' 'kconfig'
         'kcoreaddons' 'kdbusaddons' 'kwindowsystem' 'knotifications')
makedepends=('extra-cmake-modules' 'git' 'corrosion-git' 'qt5-svg' 'qt5-tools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd angelfish
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S angelfish
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}