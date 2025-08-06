# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgbase=wl-mirror
pkgname=wl-mirror-git
pkgver=0.18.3.r0.gd324810
pkgrel=3
pkgdesc="a simple Wayland output mirror client"
url="https://github.com/Ferdi265/wl-mirror"
arch=(x86_64)
license=(GPL-3.0-or-later)
provides=("wl-mirror=${pkgver%%.r*}")
conflicts=('wl-mirror')
depends=(
  bash
  glibc
  libglvnd
  wayland
  libdecor
  mesa
  libdrm
)
makedepends=(
  cmake
  ninja
  scdoc
)
optdepends=(
  'slurp: for selecting regions and outputs in wl-present'
  'pipectl: for managing named pipes in wl-present'
  'wofi: for interactive selection of options in wl-present'
  'wmenu: for interactive selection of options in wl-present'
  'rofi: for interactively selecting options in wl-present'
  'dmenu: for interactive selection of options in wl-present'
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
    -D WITH_LIBDECOR=ON
    -D WITH_GBM=ON
    -G Ninja
    -S $_pkgbase
    )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -dm755 "$pkgdir/usr/share/zsh/site-functions" \
                 "$pkgdir/usr/share/bash-completion/completions"

  cd "$_pkgbase"
  install -Dm644 scripts/completions/zsh-completions/* \
    -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 scripts/completions/bash-completions/* \
    -t "$pkgdir/usr/share/bash-completion/completions"
}
