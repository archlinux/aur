# Maintainer: redtide <redtid3@gmail.com>

_pkgname=magnifiqus
pkgname=$_pkgname-git
pkgver=0.2.1.r7.g7dde53a
pkgrel=1
pkgdesc="Qt based screen magnifier"
url=https://github.com/redtide/$_pkgname
arch=(x86_64)
license=(GPL2)
depends=(
  qt5-base
  qt5-x11extras
)
makedepends=(
  cmake
  git
  qt5-tools
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

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.external.lxqt-build-tools.url ../lxqt-build-tools
  git submodule update
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -Wno-dev
    -B build
    -S $_pkgname
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
