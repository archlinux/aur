# Maintainer: Shaun Lastra <shaun@lastra.us>

pkgname=dp100-studio
pkgver=0.1.0
pkgrel=1
pkgdesc='Control and monitor the ALIENTEK DP100 USB-C bench power supply'
arch=('x86_64' 'aarch64')
url='https://github.com/slastra/dp100-studio'
# The app is GPL; the bundled dp100 command-line tool is MIT or Apache-2.0.
license=('GPL-3.0-or-later' 'MIT OR Apache-2.0')
depends=('gtk4' 'libadwaita' 'glib2' 'pango' 'graphene' 'libgcc' 'glibc' 'hicolor-icon-theme')
makedepends=('cargo')
install=dp100-studio.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0ab8e7ed2490ea570e0ea19cf4b28b06bbaa28310b6489b90fad777cf30885d')
_srcdir="$pkgname-$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  # --locked: Cargo.lock is committed; resolving afresh could build against
  # different dependency versions than the ones tested.
  cargo fetch --locked --target "$(rustc -vV | sed -n "s/^host: //p")"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p dp100-studio
  # The command-line tool lives behind the protocol crate's cli feature.
  cargo build --frozen --release -p dp100 --features cli --bin dp100
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Everything but the hardware tests, which are ignored unless DP100_HIL=1.
  cargo test --frozen --release -p dp100 --all-features
  cargo test --frozen --release -p dp100-studio
}

package() {
  cd "$_srcdir"
  local id=io.github.slastra.DP100Studio
  install -Dm755 target/release/dp100-studio -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/dp100 -t "$pkgdir/usr/bin/"
  install -Dm644 "data/$id.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/$id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "data/icons/hicolor/scalable/apps/$id.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/icons/hicolor/symbolic/apps/$id-symbolic.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  # Lets the user at the active seat open the DP100's hidraw node.
  install -Dm644 data/udev/70-dp100.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 README.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/sequences/*.toml -t "$pkgdir/usr/share/doc/$pkgname/examples/"
  install -Dm644 crates/dp100-studio/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"
  install -Dm644 crates/dp100/LICENSE-MIT crates/dp100/LICENSE-APACHE \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
