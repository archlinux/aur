# Maintainer: redtide <redtid3@gmail.com>

_pkgname=voltrayke
pkgname=$_pkgname-git
pkgver=r32.a9e7fdd
pkgrel=1
pkgdesc="Audio volume system tray widget"
url="https://github.com/qtilities/$_pkgname"
license=(GPL2)
arch=(x86_64)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha512sums=('SKIP')
makedepends=(
  cmake
  git
  qt6-tools
  qtilitools
)
depends=(
  alsa-lib
  libpulse
  libstatusnotifieritem-qt6
  qt6-base
)

pkgver() {
  cd "$srcdir/$_pkgname"
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
    -D PROJECT_QT_VERSION=6
    -S "$srcdir/$_pkgname"
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
