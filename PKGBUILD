# Maintainer: Campbell Barton <ideasman42@gmail.com>
_pkgname=st-rs
_version=git
pkgver=0.1.0.r86.g8051209
pkgname=${_pkgname}-${_version}
pkgrel=1
pkgdesc="Minimal terminal emulator for Wayand in the spirit of ST, written in Rust."
arch=('x86_64')
url="https://codeberg.org/ideasman42/${_pkgname}"
license=('MIT')
depends=(
    'fontconfig'
    'wayland'
    'libxkbcommon'
    'libutf8proc'
)
makedepends=(
    'cargo'
    'git'
    'ncurses'
)
optdepends=(
)
provides=("st-rs=$pkgver")
conflicts=('st-rs')
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
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install_only
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
