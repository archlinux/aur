# Maintainer: aur.chaotic.cx
# Contributor: Adam Harvey <adam@adamharvey.name>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${RUSTUP_TOOLCHAIN:=stable}
: ${CARGO_TARGET_DIR:=target}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="tuc"
pkgname="$_pkgname"
pkgver=1.3.0
pkgrel=2
pkgdesc="A more powerful alternative to cut"
url="https://github.com/riquito/tuc"
license=('GPL-3.0-or-later')
arch=("x86_64" "aarch64")

depends=(
  'libgcc'
)
makedepends=(
  'cargo'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('81dc5f4a0355ecdf9515c88c34c365d20f339d316df7dbe72667cd2b18445c61')

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "doc/tuc.1" -t "$pkgdir/usr/share/man/man1/"
}
