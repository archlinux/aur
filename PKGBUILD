# Maintainer: Simon Winther <simonwinther@users.noreply.github.com>
pkgname=breakd
pkgver=0.1.5
pkgrel=1
pkgdesc='Wayland-native break reminder with multi-monitor overlays'
arch=('x86_64')
url='https://github.com/simonwinther/breakd'
license=('MIT' 'BSD-2-Clause')
depends=('cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'gtk4-layer-shell' 'libcanberra')
makedepends=('cargo' 'pkgconf')
options=('!debug')
source=("breakd-0.1.5.tar.gz::https://github.com/simonwinther/breakd/releases/download/v0.1.5/breakd-0.1.5.tar.gz")
sha256sums=('4a503bd8b4bb82844200ba381c9661253f5f4fbf1b754fc11370532dd986c172')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=."
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=."
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/breakd" "$pkgdir/usr/bin/breakd"
  install -dm755 "$pkgdir/usr/share/breakd"
  install -m644 crates/platform-linux/assets/*.oga "$pkgdir/usr/share/breakd/"
  install -Dm644 packaging/systemd/breakd.service     "$pkgdir/usr/lib/systemd/user/breakd.service"
  install -Dm644 packaging/io.github.simonwinther.breakd.settings.desktop     "$pkgdir/usr/share/applications/io.github.simonwinther.breakd.settings.desktop"
  install -Dm644 config.example.toml     "$pkgdir/usr/share/doc/breakd/config.example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/breakd/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/breakd/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md     "$pkgdir/usr/share/licenses/breakd/THIRD_PARTY_NOTICES.md"
}
