# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=nota-git
pkgver=v1.1.1.r17.gd50e906
pkgrel=3
pkgdesc="Multi-platform text editor"
arch=(x86_64)
groups=('maui-apps')
url="https://invent.kde.org/maui/nota"
license=('GPL3')
depends=('ki18n' 'knotifications' 'qt5-svg' 'kio' 'mauikit-git' 'kirigami2' 'syntax-highlighting')
makedepends=('git' 'extra-cmake-modules')
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

prepare() {
  cd "${pkgname%-git}"
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}/build"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 ../src/assets/nota.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/maui-nota.svg"
  make DESTDIR="$pkgdir" install
}
