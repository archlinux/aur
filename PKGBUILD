# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

: ${_commit_rawler:=42ae0157d35cf255d87068c8414ca1b381e98e83}

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.4.3
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
_pkgsrc_rawler="RapidRAW-DngLab-$_commit_rawler"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
  "$_pkgname-rawler-${_commit_rawler::7}.$_pkgext"::"https://github.com/CyberTimon/RapidRAW-DngLab/archive/${_commit_rawler}.$_pkgext"
)
sha256sums=(
  '80ba607657e86fc72de2f51c05a2a8e7e985bb4f1116ac2ef98b197582359623'
  '164d9f63696e83464d065c14573ea353ac400e700b56e10b5a62f190653c3f4a'
)

prepare() {
  cd "$_pkgsrc"

  # prepare rawler
  rm -r "src-tauri/rawler"
  ln -sf "$srcdir/$_pkgsrc_rawler" "src-tauri/rawler"

  # compile faster
  sed -E \
    -e 's&^(codegen-units) = .*$&\1 = 16&' \
    -e 's&^(lto) = .*$&&' \
    -i src-tauri/Cargo.toml \
    src-tauri/rawler/Cargo.toml
}

build() {
  cd "$_pkgsrc"
  npm install
  cargo-tauri build --bundles deb
}

package() {
  cd "$_pkgsrc"
  cp -r "src-tauri/${CARGO_TARGET_DIR}/release/bundle/deb/RapidRAW_${pkgver%%.r*}_amd64/data"/* "$pkgdir/"
}
