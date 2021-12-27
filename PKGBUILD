# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts-git
pkgver=r542.eab5d08
pkgrel=1
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Kirigami-based podcast player"
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'purpose' 'kirigami2'
         'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication' 'taglib')
makedepends=('extra-cmake-modules' 'git' 'qt5-svg' 'qt5-tools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
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