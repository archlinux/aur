# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="anyrun"
pkgname="$_pkgname"
pkgver=25.9.2
pkgrel=1
pkgdesc="A wayland native, highly customizable runner"
url="https://github.com/anyrun-org/anyrun"
license=('GPL-3.0-only')
arch=("x86_64")

depends=(
  'gtk4-layer-shell'
)
makedepends=(
  'cargo'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('76adfd5e0f0de1f7c6e760a7cbb6cba5054a931160bd5848cc949832928d3730')

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"

  for i in "$CARGO_TARGET_DIR/release"/*.so; do
    install -Dm644 "$CARGO_TARGET_DIR/release"/*.so -t "$pkgdir/usr/lib/anyrun/"
  done

  install -Dm644 examples/config.ron -t "$pkgdir/etc/xdg/anyrun/"
  install -Dm644 anyrun/res/style.css -t "$pkgdir/etc/xdg/anyrun/"
}
