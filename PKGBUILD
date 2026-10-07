# Maintainer: aur.chaotic.cx

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.6.5
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
sha256sums=('6b415a041a46bcc240fbda2424ae7eb0f384fcd86cb073d129ba9ade0b1b55b5')

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
