# Maintainer: redtide <redtid3@gmail.com>

_gitname=icon-theme-nuovext
_pkgname=nuovext-icon-theme
pkgname=$_pkgname-git
pkgver=0.1.1.r5.g8ac099a
pkgrel=1
pkgdesc="nuoveXT2 icon theme (git version)"
url=https://github.com/redtide/$_gitname
arch=(any)
license=(LGPL3)
depends=(
  gtk-update-icon-cache
)
makedepends=(
  cmake
  git
)
provides=($_pkgname)
conflicts=($_pkgname)
install=nuovext-icon-theme.install
source=($_pkgname::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_pkgname
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
