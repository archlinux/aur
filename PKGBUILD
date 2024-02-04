# Maintainer: redtide <redtid3@gmail.com>

_pkgname=sddm-conf
pkgname=$_pkgname-git
pkgver=0.2.0.r0.ge9d21d0
pkgrel=1
pkgdesc="SDDM Configuration Editor"
arch=(
  i686
  x86_64
)
url="https://github.com/qtilities/sddm-conf"
license=(MIT)
depends=(
  polkit
  sddm
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
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -S .
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
