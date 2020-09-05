# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=buho-git
pkgver=v1.1.1.r17.gd50e906
pkgrel=1
pkgdesc="Task and Note Keeper"
arch=('x86_64')
url="https://invent.kde.org/maui/buho"
license=('GPL3')
depends=('ki18n' 'qt5-webview' 'mauikit-git' 'kio' 'syntax-highlighting' 'attica')
makedepends=('git' 'extra-cmake-modules')
provides=('buho')
conflicts=('buho')
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
  install -Dm644 ../src/assets/buho.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/buho.svg"
  make DESTDIR="$pkgdir" install
}