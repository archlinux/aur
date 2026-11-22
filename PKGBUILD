# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=bt-w
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI and tray icon for the Creative BT-W5 and BT-W6 Bluetooth audio dongles"
arch=('x86_64' 'aarch64')
url="https://github.com/emaspa/bt-w"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'systemd-libs')
makedepends=('cargo')
# hidapi's bundled C code, built as GCC LTO bitcode, won't link into the Rust binary.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ccfccc3c276292abb20b45353976c18a2228d4842337a4f6ff007788d11e0048')

# The same flags for build and check, or check compiles everything again.
# The remap keeps the build directory out of the binary.
_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  _cargo_env
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  _cargo_env
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/bt-w "$pkgdir/usr/bin/bt-w"
  install -Dm644 70-creative-bt-w.rules "$pkgdir/usr/lib/udev/rules.d/70-creative-bt-w.rules"
  install -Dm644 bt-w-tray.desktop "$pkgdir/usr/share/applications/bt-w-tray.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
