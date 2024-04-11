# Maintainer: redtide <redtid3@gmail.com>

_pkgname=labwc-tweaks
pkgname=$_pkgname-git
pkgver=r76.7f2d04f
pkgrel=1
pkgdesc="Simple configuration GUI application for labwc"
url="https://github.com/labwc/labwc-tweaks"
license=(GPL2)
arch=(x86_64)
depends=(
  glib2
  libxml2
  qt6-base
)
makedepends=(
  cmake
  git
  qt6-tools
)
source=(
  "$_pkgname::git+$url.git"
)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
  cmake ${cmake_options[@]}
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 "$srcdir/$_pkgname/BSD-3-Clause" -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -vDm 644 "$srcdir/$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
}
