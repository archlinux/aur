# Maintainer: David Yusaku <davidyusaku13 at gmail dot com>

pkgname=termul-manager
pkgver=0.3.2
pkgrel=11
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'disable-xterm-webgl.patch'
  'linux-integration-fixes.patch'
  'form-control-theme.patch'
  'aur-update-check.patch'
)
sha256sums=(
  '34883aed783084c4ae25564df09422bed05941eb75175f2644a91a21c342c328'
  'e85a219b574e898ba6f871bb4ec7ec210e49271b62325bb6791fe0be6c00e3c9'
  'ff9fc001c5824d2c889f9a719439d113874724fd5d8940036e7c586a36663afd'
  '01e5030b5add9fc9acfb303e45d4497ff7e2733e2e149dd2b836874edabc2169'
  '2498a883247694f90888ff2fa54270017d67699cb7788e7694d64749e2056e5f'
)

prepare() {
  cd "termul-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export HUSKY=0
  export npm_config_cache="$srcdir/npm-cache"

  patch -Np1 < "$srcdir/disable-xterm-webgl.patch"
  patch -Np1 < "$srcdir/linux-integration-fixes.patch"
  patch -Np1 < "$srcdir/form-control-theme.patch"
  patch -Np1 < "$srcdir/aur-update-check.patch"

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
  sed -i '/^\[build-dependencies\]/i [features]\ndefault = ["custom-protocol"]\ncustom-protocol = ["tauri/custom-protocol"]\n' \
    src-tauri/Cargo.toml

  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "termul-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=src-tauri/target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  export RUSTUP_TOOLCHAIN=stable

  npm run build:frontend:tauri
  cargo build --frozen --release --manifest-path src-tauri/Cargo.toml --features custom-protocol
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
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 termul-manager
Icon=termul-manager
Terminal=false
Type=Application
Categories=Utility;TerminalEmulator;Development;
EOF
}
