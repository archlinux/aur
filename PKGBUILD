# Maintainer: Campbell Barton <ideasman42@gmail.com>
_pkgname=ionwl
_version=git
pkgver=0.1.0.r818.ge8c9d3c
pkgname=${_pkgname}-${_version}
pkgrel=1
pkgdesc="Manual tiling Wayland compositor."
arch=('x86_64')
url="https://codeberg.org/ideasman42/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'fontconfig'
    'libinput'
    'seatd'
    'libxkbcommon'
    'mesa'
    'python'
    'wayland'
)
makedepends=(
    'cargo'
    'git'
    'python-sphinx'
    # Headless backend for extracting Python API documentation.
    'weston'
)
optdepends=(
    'xorg-xwayland: XWayland support'
)
provides=('ionwl')
conflicts=('ionwl')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  # Format: cargo_version.rCOMMIT_COUNT.gSHORT_HASH
  local ver
  ver=$(grep '^version' Cargo.toml | head -1 | cut -d'"' -f2)
  printf '%s.r%s.g%s' \
    "$ver" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  export CARGO_HOME="$srcdir/cargo-home"
  make build
  # Run doc targets sequentially: doc-html needs RST sources from doc-gen.
  make -j1 doc doc-stubs
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install_only
}
