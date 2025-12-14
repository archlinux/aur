# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: redtide <redtid3@gmail.com>

_pkgname=sddm-conf
pkgname=$_pkgname-git
pkgver=0.4.0.r0.g11d96aa
pkgrel=1
pkgdesc="SDDM Configuration Editor"
arch=('x86_64')
url="https://github.com/qtilities/sddm-conf"
license=('MIT')
depends=(
  'polkit'
  'sddm'
  'qt6-base'
)
makedepends=(
  'cmake'
  'git'
  'qt6-tools'
  'qtilitools'
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
    -D CMAKE_BUILD_TYPE=Release
    -D PROJECT_QT_VERSION=6
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
