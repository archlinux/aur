# Maintainer: redtide <redtid3@gmail.com>

_pkgname=colorpick
pkgname=$_pkgname-git
pkgver=0.1.0.r0.g8d0efbf
pkgrel=1
pkgdesc="Color picker and contrast checker"
url=https://github.com/qtilities/$_pkgname
arch=(x86_64)
license=(BSD)
depends=(
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
source=(
  $_pkgname::git+$url.git
  $_pkgname/resources::git+https://github.com/qtilities-i18n/$_pkgname.git
)
sha512sums=(
  'SKIP'
  'SKIP'
)
pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # Configure in prepare() because downloading translations via git with CMake
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_pkgname
    -W no-dev
  )
  cmake "${cmake_options[@]}"
}

build() {
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$_pkgname/
}
