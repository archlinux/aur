# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=koko-git
pkgver=v21.05.r8.g3f9411a
pkgrel=2
arch=(x86_64 i686 arm armv6h armv7h aarch64)
pkgdesc="Image gallery application designed for desktop and touch devices"
url="https://invent.kde.org/graphics/koko"
license=('LGPL2.1')
depends=('kirigami2' 'kcoreaddons' 'kguiaddons' 'kconfig' 'knotifications' 'kquickimageeditor'
         'exiv2' 'kdeclarative' 'kfilemetadata' 'ki18n' 'kio' 'kdbusaddons' 'qt5-location')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("git+${url}.git")
md5sums=('SKIP')

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