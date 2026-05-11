# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Prebuilt Cliprithm AppImage packaged for Arch Linux"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm')
source=("Cliprithm_1.3.1_amd64.AppImage::https://github.com/BOTOOM/Cliprithm/releases/download/cliprithm-v1.3.1/Cliprithm_1.3.1_amd64.AppImage" "cliprithm.png::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.3.1/src-tauri/icons/128x128.png" "LICENSE::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.3.1/LICENSE")
sha256sums=('54892bc60c67f087b4d9ce1be0e4f4a67bf672f5c1df94d48b8f6901268af3df' 'c7f874d897675e666ae09da79dfefeed2aa5bf9f51da33bf931050c5087b6a80' 'd90660ef692577f22ad72ccabe19ff6d10c4047d5a8345bf748f0c044932b52c')
noextract=('Cliprithm_1.3.1_amd64.AppImage')

package() {
  install -Dm755 "$srcdir/Cliprithm_1.3.1_amd64.AppImage" "$pkgdir/opt/cliprithm/cliprithm.AppImage"
  install -Dm644 "$srcdir/cliprithm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cat > "$srcdir/cliprithm" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
export CLIPRITHM_DISTRIBUTION_CHANNEL=aur-bin
export CLIPRITHM_UPDATE_STRATEGY=store-managed
export CLIPRITHM_PACKAGE_NAME=cliprithm-bin
export CLIPRITHM_STORE_NAME=AUR
export CLIPRITHM_STORE_URL=https://aur.archlinux.org/packages/cliprithm-bin
export CLIPRITHM_STORE_INSTRUCTIONS='yay -Syu cliprithm-bin'
export CLIPRITHM_VERSION_SOURCE_TYPE=aur-rpc
export CLIPRITHM_VERSION_SOURCE_URL=https://aur.archlinux.org/rpc/v5/info/cliprithm-bin
export APPIMAGE_EXTRACT_AND_RUN=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export LIBGL_ALWAYS_SOFTWARE=1
exec /opt/cliprithm/cliprithm.AppImage "$@"
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
