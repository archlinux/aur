# Maintainer:
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname="ion"
pkgname="$_pkgname-git"
pkgver=r2191.85452cfa
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux. (Git version)"
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
source=('git+https://gitlab.redox-os.org/redox-os/ion.git')
sha256sums=('SKIP')

_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

prepare() {
  _cargo_env

  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _cargo_env

  cd "$_pkgsrc"
  cargo build --frozen --release
}

package() {
  _cargo_env

  install -Dm755 "$_pkgsrc/$CARGO_TARGET_DIR/release/ion" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
