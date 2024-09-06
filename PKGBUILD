# Maintainer:
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="ion"
pkgname="$_pkgname-git"
pkgver=1.0.5.r1511.gb1b9475
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
url="https://gitlab.redox-os.org/redox-os/ion"
license=('MIT')
arch=("x86_64" "i686")

depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release
}

package() {
  install -Dm755 "$_pkgsrc/$CARGO_TARGET_DIR/release/ion" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
