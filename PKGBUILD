# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

_pkgname=picom-conf
pkgname=$_pkgname-git
pkgver=0.17.0.r2.g9cdd2cd
pkgrel=1
pkgdesc="GUI configuration tool for Picom X composite manager"
arch=(
  i686
  x86_64
)
url="https://github.com/qtilities/picom-conf"
license=(LGPL2.1)
depends=(
  libconfig
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
}
