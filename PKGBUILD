# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=pix-maui-git
pkgver=v1.1.1.r34.ge2ceb78
pkgrel=2
pkgdesc="Image gallery application"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/pix"
license=('GPL3')
depends=('ki18n' 'qt5-location' 'mauikit-git' 'kio' 'syntax-highlighting' 'attica' 'exiv2' 'kquickimageeditor')
makedepends=('git' 'extra-cmake-modules')
provides=('pix-maui')
conflicts=('pix-maui')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd pix
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd pix
  mkdir build
}

build() {
  cd pix/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd pix/build
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 ../src/assets/pix.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pix.svg"
  make DESTDIR="$pkgdir" install
}