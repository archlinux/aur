# Maintainer: aur.chaotic.cx

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.6.4
pkgrel=1
url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'npm'
)

options=('!lto')

_pkgsrc="RapidRAW-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('f2f2c816e68ef79a5f929bfbb9e45d609a9d08d70a7549307487e35aeb34b540')

build() {
  local _units=$(($(nproc) > 16 ? $(nproc) : 16))
  export RUSTFLAGS="-C opt-level=2 -C codegen-units=$_units -C lto=off"

  cd "$_pkgsrc"
  npm install
  cargo-tauri build --bundles deb
}

package() {
  cd "$_pkgsrc"
  cp -r "src-tauri/${CARGO_TARGET_DIR}/release/bundle/deb/RapidRAW_${pkgver%%.r*}_amd64/data"/* "$pkgdir/"
}
