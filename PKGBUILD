# Maintainer: David Yusaku <davidyusaku13 at gmail dot com>

pkgname=termul-manager
pkgver=0.3.6
pkgrel=1
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
)
sha256sums=('76520ab7415adaeac7e891397ff8ce5304f2259e49ed117ed85bda30230078f2'
            'f1eb85aacb293e1f72e7c68d156e733185081b92c2d1ae44a62966041a629e78'
            'ff9fc001c5824d2c889f9a719439d113874724fd5d8940036e7c586a36663afd'
            '01e5030b5add9fc9acfb303e45d4497ff7e2733e2e149dd2b836874edabc2169')

prepare() {
  cd "termul-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export HUSKY=0
  export npm_config_cache="$srcdir/npm-cache"

  patch -Np1 < "$srcdir/disable-xterm-webgl.patch"
  patch -Np1 < "$srcdir/linux-integration-fixes.patch"
  patch -Np1 < "$srcdir/form-control-theme.patch"
  # aur-update-check.patch removed: upstream now supports VITE_TERMUL_UPDATE_MODE=aur natively

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

  sed -i '/name = "termul-manager"/{n;s/version = "0.3.3"/version = "0.3.4"/;}' \
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
  export VITE_TERMUL_UPDATE_MODE=aur

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
