# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

: ${_commit_rawler:=f56a4fa204134cc301e093ce102523c0ca995f76}

_pkgname="rapidraw"
pkgname="$_pkgname"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.4.6
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
  'f262e3990ca7023507d52e3ebc119bcc584ee5bb2d46e6223449f151e81b9d2f'
  '9f96fa24f21d75fb8465950aaa1925702472252a0fa52fded041c8142f9bd0b5'
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
