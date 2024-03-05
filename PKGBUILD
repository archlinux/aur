# Maintainer: redtide <redtid3@gmail.com>

_pkgname=libdbusmenu-qtilities
pkgbase=$_pkgname-git
pkgname=(libdbusmenu-qtilities{5,6}-git)
pkgver=r367.bd5c6a3
pkgrel=1
pkgdesc="Qt implementation of the DBusMenu protocol"
arch=(
  i686
  x86_64
)
url="https://github.com/qtilities/$_pkgname"
license=(LGPL)
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
    cmake \
      -B build$v \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=None \
      -D DBUSMENU_QT_VERSION=$v \
      -S "$srcdir/$_pkgname" \
      -W no-dev
    cmake --build build$v --verbose
  done
}

package_libdbusmenu-qtilities5-git() {
  depends=(qt5-base)
  provides=(${_pkgname}5)
  conflicts=(${_pkgname}5)
  DESTDIR="$pkgdir" cmake --install build5
}

package_libdbusmenu-qtilities6-git() {
  depends=(qt6-base)
  provides=(${_pkgname}6)
  conflicts=(${_pkgname}6)
  DESTDIR="$pkgdir" cmake --install build6
}
