# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="rapidraw"
pkgname="$_pkgname-git"
pkgdesc="GPU-accelerated RAW image editor"
pkgver=1.5.1.r0.g24e0e69+718400a
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
  'git'
  'npm'
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
}

pkgver() (
  cd "$srcdir/$_pkgsrc"
  local _gitver _libhash
  _gitver=$(git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g')
  _rawler_hash=$(git -C src-tauri/rawler rev-parse --short=7 HEAD)
  printf '%s+%s' "$_gitver" "$_rawler_hash"
)

build() {
  local _units=$(OMP_NUM_THREADS=16 nproc --all)
  export RUSTFLAGS="-C opt-level=2 -C codegen-units=$_units -C lto=off"

  cd "$_pkgsrc"
  npm install
  cargo-tauri build --bundles deb
}

package() {
  cd "$_pkgsrc"
  cp -r "src-tauri/${CARGO_TARGET_DIR}/release/bundle/deb/RapidRAW_${pkgver%%.r*}_amd64/data"/* "$pkgdir/"
}
