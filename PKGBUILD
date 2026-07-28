# Maintainer:
# Contributor: Víctor Javier Díaz Garrido <vicdigar at hotmail dot com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="novafetch"
pkgname="$_pkgname-git"
pkgver=0.4.0.r0.g5e8a6ec
pkgrel=1
pkgdesc="Simple tool written in Rust to get information about your pc"
url="https://github.com/victorjdg/novafetch"
license=('GPL-3.0-only')
arch=('x86_64')

depends=('libgcc')
makedepends=(
  'cargo'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  cargo fetch --target host-tuple
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _units=$(($(nproc) > 16 ? $(nproc) : 16))
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$_units

  cd "$_pkgsrc"
  cargo build --release --all-features
}

check() {
  cd "$_pkgsrc"
  cargo test --frozen --all-features
}

package() {
  install -Dm755 "$_pkgsrc/$CARGO_TARGET_DIR/release/novafetch" "$pkgdir/usr/bin/novafetch"
}
