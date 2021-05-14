# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=nota-git
pkgver=v1.2.2.r2.g20a4e3d
pkgrel=1
pkgdesc="Multi-platform text editor"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
groups=('maui-apps')
url="https://invent.kde.org/maui/nota"
license=('GPL3')
depends=('ki18n' 'knotifications' 'kio' 'mauikit-git' 'kirigami2' 'syntax-highlighting' 'mauikit-filebrowsing-git')
makedepends=('git' 'extra-cmake-modules' 'qt5-svg' 'qt5-tools')
provides=('nota')
conflicts=('nota')
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