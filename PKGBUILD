# Maintainer: redtide <redtid3@gmail.com>

_pkgname=voltrayke
pkgname="$_pkgname-git"
pkgver=r28.5d7bae4
pkgrel=1
pkgdesc="Audio volume system tray widget"
url=https://github.com/qtilities/$_pkgname
arch=(x86_64)
license=(GPL2)
depends=(
  alsa-lib
  libpulse
  qt5-base
)
makedepends=(
  cmake
  git
  qt5-tools
  qtilitools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -S $_pkgname
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
