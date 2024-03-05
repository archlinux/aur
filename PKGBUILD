# Maintainer: redtide <redtid3@gmail.com>

_pkgname=omgmounter
pkgname=$_pkgname-git
pkgver=r13.86e3081
pkgrel=1
pkgdesc="CDEmu CD/DVD image mounter frontend"
arch=(
  i686
  pentium4
  x86_64
)
url="https://github.com/qtilities/omgmounter"
license=(GPL3)
makedepends=(
  cmake
  doxygen
  git
)
depends=(
  cdemu-client
  libstatusnotifieritem-qt6
  qt6-base
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D PROJECT_QT_VERSION=6
    -S "$srcdir/$_pkgname"
    -W no-dev
  )
  cmake ${cmake_options[@]}
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
