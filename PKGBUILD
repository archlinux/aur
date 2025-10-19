# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="rapidraw"
pkgname="$_pkgname-git"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.4.3.r0.g8720242
pkgrel=1
url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'npm'
  'cargo'
  'cargo-tauri'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1

  # ensure version is set
  local _pkgver=$(pkgver)
  sed -E -e 's&("version": ").*(",?)&\1'"${_pkgver%%.r*}\\2&" -i src-tauri/tauri.conf.json

  # compile faster
  sed -E \
    -e 's&^(codegen-units) = .*$&\1 = 16&' \
    -e 's&^(lto) = .*$&&' \
    -i src-tauri/Cargo.toml \
    src-tauri/rawler/Cargo.toml
}

pkgver() (
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  cd "$_pkgsrc"
  npm install
  cargo-tauri build --bundles deb
}

package() {
  cd "$_pkgsrc"
  cp -r "src-tauri/${CARGO_TARGET_DIR}/release/bundle/deb/RapidRAW_${pkgver%%.r*}_amd64/data"/* "$pkgdir/"
}
