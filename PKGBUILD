# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kquickchatcomponents-git
pkgver=r15.f184bbc
pkgrel=1
pkgdesc="Set of chat components for QtQuick chat apps wishing to fit in with KDE's collection of chat apps"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/libraries/kquickchatcomponents"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative')
makedepends=('git' 'extra-cmake-modules')
provides=('kquickimageeditor')
conflicts=('kquickimageeditor')
source=("git+$url.git")
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
