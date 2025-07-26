# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: vaibhav-mattoo <vaibhav.mattoo@gmail.com>
# Contributor: fuckotheclown <fuckotheclown@example.com>
pkgname=bitchat-tui
pkgver=0.1.0
pkgrel=6
pkgdesc="Secure, anonymous, peer-to-peer Bluetooth chat with terminal UI"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/vaibhav-mattoo/bitchat-tui"
license=('MIT')
depends=('dbus' 'bluez' 'pkgconf')
makedepends=('rust' 'cargo' 'git' 'dbus' 'pkgconf')
provides=('bitchat-tui')
conflicts=('bitchat-tui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vaibhav-mattoo/$pkgname/archive/v$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz::https://github.com/vaibhav-mattoo/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()

prepare() {
  cd "$pkgname-$pkgver"
  # Remove the vendored feature to use the system's dbus library
  # sed -i '/\[target.cfg(target_os = "linux")\].dependencies\]/{n;s/, features = \["vendored"\]//}' Cargo.toml
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Ensure pkg-config can find dbus
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
  export DBUS_CFLAGS="$(pkg-config --cflags dbus-1)"
  export DBUS_LIBS="$(pkg-config --libs dbus-1)"
  # Additional linking flags for dbus
  export RUSTFLAGS="-L/usr/lib -ldbus-1"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Set environment variables for proper D-Bus linking during tests
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
  export DBUS_CFLAGS="$(pkg-config --cflags dbus-1)"
  export DBUS_LIBS="$(pkg-config --libs dbus-1)"
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Create configuration directory
  install -dm 755 "$pkgdir/etc/$pkgname"

  # Install systemd user service for auto-start (optional)
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/$pkgname-$pkgver/contrib/systemd/bitchat-tui.service" 2>/dev/null || true

  # Install shell completion files if they exist
  install -Dm 644 -t "$pkgdir/usr/share/bash-completion/completions/" "$srcdir/$pkgname-$pkgver/contrib/completions/$pkgname.bash" 2>/dev/null || true
  install -Dm 644 -t "$pkgdir/usr/share/zsh/site-functions/" "$srcdir/$pkgname-$pkgver/contrib/completions/_$pkgname" 2>/dev/null || true
  install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_completions.fish/" "$srcdir/$pkgname-$pkgver/contrib/completions/$pkgname.fish" 2>/dev/null || true
}
