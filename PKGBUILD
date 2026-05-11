# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm
pkgver=1.3.1
pkgrel=1
pkgdesc="Smart desktop video silence remover and clip editor built with Tauri and FFmpeg"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm' 'patchelf' 'rust')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm-bin')
source=("cliprithm-1.3.1.tar.gz::https://github.com/BOTOOM/Cliprithm/archive/refs/tags/cliprithm-v1.3.1.tar.gz")
sha256sums=('9e3e80c0abcf2879e90cfd734f2ff0ea925e8e1af8a9678cf822965c72895a7d')
options=('!lto')

prepare() {
  cd "Cliprithm-cliprithm-v1.3.1"
  export CARGO_HOME="$srcdir/cargo-home"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci --cache "$npm_config_cache" --prefer-offline
}

build() {
  cd "Cliprithm-cliprithm-v1.3.1"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  npm run tauri build -- --no-bundle --ci --no-sign
}

package() {
  cd "Cliprithm-cliprithm-v1.3.1"

  install -Dm755 "$srcdir/target/release/cliprithm" "$pkgdir/usr/lib/cliprithm/cliprithm"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cat > "$srcdir/cliprithm" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
export CLIPRITHM_DISTRIBUTION_CHANNEL=aur
export CLIPRITHM_UPDATE_STRATEGY=store-managed
export CLIPRITHM_PACKAGE_NAME=cliprithm
export CLIPRITHM_STORE_NAME=AUR
export CLIPRITHM_STORE_URL=https://aur.archlinux.org/packages/cliprithm
export CLIPRITHM_STORE_INSTRUCTIONS='yay -Syu cliprithm'
export CLIPRITHM_VERSION_SOURCE_TYPE=aur-rpc
export CLIPRITHM_VERSION_SOURCE_URL=https://aur.archlinux.org/rpc/v5/info/cliprithm
exec /usr/lib/cliprithm/cliprithm "$@"
EOF
  install -Dm755 "$srcdir/cliprithm" "$pkgdir/usr/bin/cliprithm"

  cat > "$srcdir/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cliprithm
Comment=Smart video silence remover and clip editor
Exec=cliprithm
Icon=cliprithm
Categories=AudioVideo;AudioVideoEditing;Video;
Terminal=false
StartupWMClass=cliprithm
EOF

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
