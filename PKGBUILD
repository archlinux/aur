# Maintainer:
# Contributor: James Williams <jowilliams12000 at gmail dot com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="wallust"
pkgname="$_pkgname-git"
pkgver=3.4.0.r9.g0a0e7c0
pkgrel=1
pkgdesc="Generate colors from an image"
url="https://codeberg.org/explosion-mental/wallust"
license=('MIT')
arch=('x86_64')

depends=(
  'gcc-libs'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'imagemagick'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  sed -E '/FISHPREFIX/s&(\$\{PREFIX\})/fish&\1/share/fish&' -i Makefile

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release
}

package() {
  cd "$_pkgsrc"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
