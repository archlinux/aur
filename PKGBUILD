# Maintainer: Frank Dierolf <frank_dierolf@web.de>
pkgname=whis-desktop-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Voice-to-text desktop application"
arch=('x86_64')
url="https://github.com/frankdierolf/whis"
license=('MIT')
provides=('whis-desktop')
conflicts=('whis-desktop')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
optdepends=(
  'libappindicator-gtk3: System tray support'
)
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/frankdierolf/whis/releases/download/v${pkgver}/whis-desktop_${pkgver}_amd64.AppImage")
sha256sums=('SKIP') # Replace with actual checksum

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install binary
  install -Dm755 "squashfs-root/usr/bin/whis-desktop" "${pkgdir}/usr/bin/whis-desktop"

  # Install desktop file
  install -Dm644 "squashfs-root/usr/share/applications/whis-desktop.desktop" \
    "${pkgdir}/usr/share/applications/whis-desktop.desktop"

  # Install icons
  for size in 32x32 128x128 256x256; do
    if [[ -f "squashfs-root/usr/share/icons/hicolor/${size}/apps/whis-desktop.png" ]]; then
      install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/whis-desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/whis-desktop.png"
    fi
  done

  # Install license
  install -Dm644 "squashfs-root/usr/share/licenses/whis-desktop/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
