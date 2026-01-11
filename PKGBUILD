# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

: ${_commit_rawler:=8b30471149134346dbf84858b5297c9e14678e27}

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.4.8
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
  '73040da8200ce72e10325c442f9bed465aada1d48c0a59ed4effcd8dafd5a0e7'
  '92c91210c1a7654ce7f785fed288b3a87cc298a7642679d64ea1d53ef1ad5a6e'
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
