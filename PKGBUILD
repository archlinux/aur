# Maintainer: redtide <redtid3@gmail.com>

_pkgname=qruler
pkgname=$_pkgname-git
pkgver=r41.a458443
pkgrel=1
pkgdesc="A simple on-screen pixel meter"
url="https://github.com/qtilities/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(
  qt5-base
)
makedepends=(
  cmake
  git
# lxqt-build-tools
  qt5-tools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url)
sha512sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.external.lxqt-build-tools.url ../lxqt-build-tools
  git submodule update
}

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  local options=(
    -D CMAKE_BUILD_TYPE="None"
    -D CMAKE_INSTALL_PREFIX="/usr"
    -W no-dev
    -B build
    -S .
  )
  cmake "${options[@]}"
  cmake --build build --verbose
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
