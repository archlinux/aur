# Maintainer: Robin <NurRobin@users.noreply.github.com>
pkgname=nursearch
pkgver=0.2.2
pkgrel=1
pkgdesc='Small local GTK4 app launcher with a plugin platform'
arch=('x86_64')
url='https://github.com/NurRobin/nursearch'
license=('MIT')
depends=('gtk4' 'sqlite' 'xdg-utils')
makedepends=('cargo')
optdepends=(
  'fd: faster file search plugin backend'
  'kdotool: KDE Plasma Wayland window switcher plugin'
  'wl-clipboard: clipboard history plugin'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c56d8f82cf1f210e5463beb69023e3a3a8f277422fbd821293ae6daa94093c3')

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
  for plugin_bin in clipboard demo emoji files web windows; do
    install -Dm755 "target/release/nursearch-$plugin_bin" \
      "$pkgdir/usr/lib/nursearch/nursearch-$plugin_bin"
  done

  local plugin
  for plugin in clipboard demo emoji files web windows; do
    install -Dm644 "plugins/$plugin/nursearch-plugin.toml" \
      "$pkgdir/usr/share/nursearch/plugins/$plugin/nursearch-plugin.toml"
    sed -i "s#entry = \\[\"../../target/debug/nursearch-$plugin\"\\]#entry = [\"/usr/lib/nursearch/nursearch-$plugin\"]#" \
      "$pkgdir/usr/share/nursearch/plugins/$plugin/nursearch-plugin.toml"
  done

  install -Dm644 nursearch.desktop "$pkgdir/usr/share/applications/nursearch.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
