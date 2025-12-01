# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=cursor-appimage
pkgver=2.1.42
pkgrel=2
pkgdesc="AI-first coding environment (AppImage version)"
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
depends=('fuse2' 'xdg-utils' 'hicolor-icon-theme')
conflicts=('cursor-bin')
options=(!strip)
_watch=("https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/" "header" "regex" "location:.*production/([a-f0-9]+)/")
_watch_value="2e353c5f5b30150ff7b874dee5a87660693d9de6"

source=(
  "cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_watch_value}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)
sha512sums=('891f4793bad3d4c3ba411cbce837a91576d526f9a31c62b755158e212d178bf7818b8d7ac7d2ffd653cd13708ff25e4842e4f8486c1c9a45f3368993ee08306a')

prepare() {
  chmod +x "${srcdir}/cursor-${pkgver}.AppImage"
}

package() {
  install -d "${pkgdir}/opt/cursor"
  install -m755 "${srcdir}/cursor-${pkgver}.AppImage" "${pkgdir}/opt/cursor/cursor.AppImage"

  # Extract AppImage to provide icons + desktop launcher
  cd "${pkgdir}/opt/cursor"
  ./cursor.AppImage --appimage-extract >/dev/null

  # Main binary wrapper
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/cursor" <<'EOF'
#!/bin/bash
exec /opt/cursor/cursor.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/cursor"

  # Desktop entry
  install -Dm644 squashfs-root/cursor.desktop \
    "${pkgdir}/usr/share/applications/cursor.desktop"

  # Icons
  for size in 16 32 48 64 128 256 512; do
    icon="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/cursor.png"
    if [[ -f "$icon" ]]; then
      install -Dm644 "$icon" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cursor.png"
    fi
  done
}
