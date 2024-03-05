# Maintainer: redtide <redtid3@gmail.com>

_pkgname=libstatusnotifieritem-qt
pkgbase=$_pkgname-git
pkgname=(libstatusnotifieritem-qt{5,6}-git)
pkgver=r13.defd3d5
pkgrel=1
pkgdesc="Qt implementation of the StatusNotifierItem specification"
arch=(
  i686
  x86_64
)
url="https://github.com/qtilities/libstatusnotifieritem-qt"
license=(LGPL2.1)
makedepends=(
  cmake
  doxygen
  git
)
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
  for v in 5 6; do
    local cmake_options=(
      -B build$v
      -D CMAKE_INSTALL_PREFIX=/usr
      -D CMAKE_BUILD_TYPE=None
      -D SNI_QT_VERSION=$v
      -S "$srcdir/$_pkgname"
      -W no-dev
    )
    cmake ${cmake_options[@]}
    cmake --build build$v --verbose
  done
}

package_libstatusnotifieritem-qt5-git() {
  depends=(qt5-base libdbusmenu-qtilities5)
  provides=(${_pkgname}5)
  conflicts=(${_pkgname}5)
  DESTDIR="$pkgdir" cmake --install build5
}

package_libstatusnotifieritem-qt6-git() {
  depends=(qt6-base libdbusmenu-qtilities6)
  provides=(${_pkgname}6)
  conflicts=(${_pkgname}6)
  DESTDIR="$pkgdir" cmake --install build6
}
