# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud-desktop
pkgname=opencloud-desktop-git
pkgver=3.0.0.r205.gad35d3d
pkgrel=1
pkgdesc='The OpenCloud desktop application - git checkout'
arch=(x86_64)
url="https://github.com/opencloud-eu/desktop"
license=(GPL-2.0-only)
depends=(
  glibc
  hicolor-icon-theme
  kdsingleapplication
  libre-graph-api
  libstdc++
  qt6-base
  qt6-declarative
  qtkeychain-qt6
  sqlite
  zlib
)
makedepends=(
  git
  cmake
  ninja
  doxygen
  extra-cmake-modules
  python-sphinx
  qt6-tools
)
conflicts=('opencloud-desktop')
provides=('opencloud-desktop')
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgname"
    -W no-dev
    -G Ninja
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D BUILD_TESTING=OFF
    -D KDE_INSTALL_SYSCONFDIR=/etc
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
