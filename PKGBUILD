# Maintainer: redtide <redtid3@gmail.com>

_pkgname=qtilitools
pkgname=$_pkgname-git
pkgver=r1.06e657d
pkgrel=1
pkgdesc="Scripts/commands used in the Qtilities organization"
url="https://github.com/qtilities/$_pkgname"
arch=(any)
license=(BSD3)
makedepends=(
  cmake
  git
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url)
sha512sums=('SKIP')
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
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}

