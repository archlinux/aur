# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

: ${_commit_rawler:=33d8d2662f12fe2362f403b3a94dc2f154caa63a}

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.4.5
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
  'b4feb0bf9eea29af2dc294783650580b88f3b7c73f59eda661f80a95bb0e6ff0'
  '981ee983ef58421c7365b86126c3b77b32787d6319de38ee9927260160e29b95'
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
