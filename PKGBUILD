# Maintainer: redtide <redtid3@gmail.com>

_pkgname=wshot
pkgname=$_pkgname-git
pkgver=1.0.2.r21.ga302158
pkgrel=1
pkgdesc="Screenshot GUI for wayland"
arch=(any)
url="https://github.com/qtilities/wshot"
license=(GPL3)
source=(git+$url)
sha512sums=(
  SKIP
)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(
  git
)
depends=(
  grim
  slurp
  zenity
  jq
)

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
