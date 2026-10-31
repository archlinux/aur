# Maintainer: Loong <xiaoyueban@nmgjg.com.cn>

pkgname=cloudreve-client
pkgver=0.3.1
pkgrel=1
pkgdesc="Desktop sync client for Cloudreve (Linux/macOS fork of the official Windows client)"
arch=('x86_64')
url="https://github.com/cedev-1/cloudreve-client"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme' 'sqlite')
makedepends=('cargo' 'nodejs' 'npm' 'pkgconf')
# Mixed Rust/C/C++ (bundled C deps): GCC LTO breaks rustc's lld link (Arch wiki)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a101ac503cbd76a0c3a9b0331e91c70f94052baea4284f81acb8d1c4b3b69724')

prepare() {
  cd "$pkgname-$pkgver"

  # Unbundle libsqlite3-sys: link the system sqlite (Arch wiki)
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

  # Upstream build scripts assume yarn; use npm instead
  sed -i 's/yarn run/npm run/g' src-tauri/tauri.conf.json

  # Root package.json so `npm run build` resolves wherever the tauri CLI
  # runs the beforeBuildCommand from
  cat > package.json <<'EOF'
{
  "name": "cloudreve-client-root",
  "private": true,
  "scripts": {
    "build": "npm --prefix ui run build",
    "dev": "npm --prefix ui run dev"
  }
}
EOF

  # Network phase: frontend deps, tauri CLI, and all cargo crates
  npm --prefix ui install --no-audit --no-fund
  npm install --no-audit --no-fund --prefix . '@tauri-apps/cli@2'
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml

  # Match upstream release.yml: source archives keep the previous version fields.
  sed -i -E 's/("version"[[:space:]]*:[[:space:]]*)"[^"]+"/\1"'"$pkgver"'"/' src-tauri/tauri.conf.json
  sed -i -E '/^\[workspace\.package\]/,/^\[/{s/^version = "[^"]+"/version = "'"$pkgver"'"/;}' Cargo.toml
}

build() {
  cd "$pkgname-$pkgver"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  # Everything is pre-fetched in prepare(); keep the build offline
  export CARGO_NET_OFFLINE=true
  ./node_modules/.bin/tauri build --no-bundle
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/cloudreve-desktop \
    "$pkgdir/usr/bin/cloudreve-desktop"

  for size in 32x32 64x64 128x128; do
    install -Dm644 "src-tauri/icons/$size.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/cloudreve-desktop.png"
  done
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/cloudreve-desktop.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cloudreve-desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cloudreve
GenericName=Cloud Sync Client
Comment=Sync folders with a Cloudreve server
Exec=cloudreve-desktop
Icon=cloudreve-desktop
Terminal=false
Categories=Network;FileTransfer;
EOF
}
