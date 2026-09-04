# Maintainer: aur.chaotic.cx

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.6.3
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
sha256sums=('afc274246224fd10fddc983a2a82893bb9ab17ab351aa05142749b26db250f31')

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
