# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgbase=wl-mirror
pkgname=wl-mirror-git
pkgver=0.16.1.r0.gea95e7f
pkgrel=1
pkgdesc="a simple Wayland output mirror client"
url="https://github.com/Ferdi265/wl-mirror"
arch=(x86_64)
license=(GPL3+)
provides=("wl-mirror=${pkgver%%.r*}")
conflicts=('wl-mirror')
depends=(
  bash
  glibc
  libglvnd
  wayland
)
makedepends=(
  cmake
  ninja
  scdoc
)
optdepends=(
  'dmenu: for interactive selection of options and wl-present'
  'pipectl: for wl-present'
  'rofi: for interactively selecting options and wl-present'
  'slurp: for selecting regions and outputs and wl-present'
)
source=(
  'git+https://github.com/Ferdi265/wl-mirror'
  'git+https://gitlab.freedesktop.org/wayland/wayland-protocols'
  'git+https://gitlab.freedesktop.org/wlroots/wlr-protocols'
)
sha512sums=('SKIP' 'SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgbase"
    git submodule init
    git config submodule.proto/wayland-protocols.url "$srcdir/wayland-protocols"
    git config submodule.proto/wlr-protocols.url "$srcdir/wlr-protocols"
    git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D INSTALL_EXAMPLE_SCRIPTS=ON
    -D INSTALL_DOCUMENTATION=ON
    -G Ninja
    -S $_pkgbase
    )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
