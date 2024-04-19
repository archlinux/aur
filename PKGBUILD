# Maintainer: redtide <redtid3@gmail.com>

_pkgname=gtk-conf
pkgname=$_pkgname-git
pkgver=r11.2e28f7e
pkgrel=1
pkgdesc="Configuration tool for GTK system properties"
arch=(
  i686
  x86_64
)
url="https://github.com/qtilities/$_pkgname"
license=(GPL2)
depends=(
  glib2
  qt6-base
)
makedepends=(
  cmake
  git
  qt6-tools
  qtilitools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S "$srcdir/$_pkgname"
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

