# Maintainer: David Yusaku <davidyusaku13 at gmail dot com>

pkgname=termul-manager
pkgver=0.3.2
pkgrel=3
pkgdesc='Project-aware terminal that treats workspaces as first-class citizens'
arch=('x86_64')
url='https://github.com/gnoviawan/termul'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'npm'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34883aed783084c4ae25564df09422bed05941eb75175f2644a91a21c342c328')

prepare() {
  cd "termul-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export HUSKY=0
  export npm_config_cache="$srcdir/npm-cache"

  npm ci

  node <<'EOF'
const fs = require('fs')
const configPath = 'src-tauri/tauri.conf.json'
const config = JSON.parse(fs.readFileSync(configPath, 'utf8'))
config.plugins.updater.active = false
config.plugins.updater.pubkey = ''
config.plugins.updater.endpoints = []
config.app.windows[0].visible = true
fs.writeFileSync(configPath, `${JSON.stringify(config, null, '\t')}\n`)
EOF

  sed -i '/name = "termul-manager"/{n;s/version = "0.3.0"/version = "0.3.2"/;}' \
    src-tauri/Cargo.lock

  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "termul-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=src-tauri/target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  export RUSTUP_TOOLCHAIN=stable

  npm run build:frontend:tauri
  cargo build --frozen --release --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "termul-$pkgver"

  install -Dm0755 src-tauri/target/release/termul-manager \
    "$pkgdir/usr/bin/termul-manager"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 src-tauri/icons/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Termul Manager
Comment=Project-aware terminal manager
Exec=env GDK_BACKEND=x11 termul-manager
Icon=termul-manager
Terminal=false
Type=Application
Categories=Utility;TerminalEmulator;Development;
EOF
}
