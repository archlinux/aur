# Maintainer: CPT-Dawn <ping@cptdawn.dev>
pkgname=voidlink
pkgver=1.1.0
pkgrel=1
pkgdesc="Keyboard-first Bluetooth manager for the terminal (TUI for BlueZ)"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/VoidLink"
license=('MIT')
depends=('bluez' 'dbus' 'glibc' 'libgcc')
makedepends=('cargo')
optdepends=('ttf-nerd-fonts-symbols-mono: device and status icons (or run with --no-nerd-font)'
            'pipewire-audio: connect Bluetooth headphones and speakers'
            'bluez-utils: bluetoothctl for troubleshooting')
install=voidlink.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dbf11f46787dd26646bb28650c842ce5efc87c4bb5963a9c51dfddd6895ace66')

prepare() {
  cd "VoidLink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "VoidLink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "VoidLink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "VoidLink-$pkgver"
  install -Dm755 target/release/voidlink "$pkgdir/usr/bin/voidlink"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 default_config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
}
