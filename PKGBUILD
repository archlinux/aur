# Maintainer: Robin <NurRobin@users.noreply.github.com>
pkgname=nursearch
pkgver=0.4.1
pkgrel=1
pkgdesc='Small local GTK4 app launcher with a plugin platform'
arch=('x86_64')
url='https://github.com/NurRobin/nursearch'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'sqlite' 'xdg-utils')
makedepends=('cargo')
optdepends=(
  'fd: faster file search plugin backend'
  'kdotool: KDE Plasma Wayland window switcher plugin'
  'wl-clipboard: clipboard history plugin'
  'kdeconnect: KDE Connect device control plugin'
  'networkmanager: network toggle / Wi-Fi connect plugin'
  'util-linux: rfkill for Bluetooth toggle (network plugin)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cee33e7991526104588a9bc24584367767ea24c5bdc5a4f0a70a3704d4acf33b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/nursearch "$pkgdir/usr/bin/nursearch"
  install -Dm755 target/release/nursearch-plugins "$pkgdir/usr/bin/nursearch-plugins"

  local plugin_bin
  for plugin_bin in clipboard demo emoji files web windows kdeconnect network desktop systemd; do
    install -Dm755 "target/release/nursearch-$plugin_bin" \
      "$pkgdir/usr/lib/nursearch/nursearch-$plugin_bin"
  done

  local plugin
  for plugin in clipboard demo emoji files web windows kdeconnect network desktop systemd; do
    install -Dm644 "plugins/$plugin/nursearch-plugin.toml" \
      "$pkgdir/usr/share/nursearch/plugins/$plugin/nursearch-plugin.toml"
    sed -i "s#entry = \\[\"../../target/debug/nursearch-$plugin\"\\]#entry = [\"/usr/lib/nursearch/nursearch-$plugin\"]#" \
      "$pkgdir/usr/share/nursearch/plugins/$plugin/nursearch-plugin.toml"
  done

  install -Dm644 nursearch.desktop "$pkgdir/usr/share/applications/nursearch.desktop"
  install -Dm644 nursearch-autostart.desktop "$pkgdir/etc/xdg/autostart/nursearch.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
