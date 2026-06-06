# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm
pkgver=1.3.2
pkgrel=1
pkgdesc="Smart desktop video silence remover and clip editor built with Tauri and FFmpeg"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'patchelf' 'pnpm' 'rust')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm-bin')
source=("cliprithm-1.3.2.tar.gz::https://github.com/BOTOOM/Cliprithm/archive/refs/tags/cliprithm-v1.3.2.tar.gz")
sha256sums=('5e2f66669900f173bc6152dd4a9d5cfb39edff9e4ee02044cbb40ec8116f3c10')
options=('!lto')

_setup_rust_toolchain() {
  export CARGO_HOME="$srcdir/cargo-home"

  if command -v rustup >/dev/null 2>&1; then
    export RUSTUP_HOME="$srcdir/rustup-home"
    export RUSTUP_TOOLCHAIN=stable
    rustup toolchain install stable --profile minimal --no-self-update
  fi
}

prepare() {
  cd "Cliprithm-cliprithm-v1.3.2"
  _setup_rust_toolchain
  export PNPM_HOME="$srcdir/pnpm-home"
  export XDG_CACHE_HOME="$srcdir/pnpm-cache"
  pnpm install --frozen-lockfile
}

build() {
  cd "Cliprithm-cliprithm-v1.3.2"
  _setup_rust_toolchain
  export CARGO_TARGET_DIR="$srcdir/target"
  pnpm run tauri build -- --no-bundle --ci --no-sign
}

package() {
  cd "Cliprithm-cliprithm-v1.3.2"

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
