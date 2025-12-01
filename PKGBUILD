# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=cursor-appimage
pkgver=2.1.42
pkgrel=3
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
  
  # Extract AppImage to access metadata
  cd "${srcdir}"
  ./cursor-${pkgver}.AppImage --appimage-extract >/dev/null
  
  # Update desktop entry to use installed paths
  if [[ -f squashfs-root/cursor.desktop ]]; then
    sed -i 's|^Exec=.*|Exec=/opt/cursor/cursor.AppImage %F|' squashfs-root/cursor.desktop
    sed -i 's|^Icon=.*|Icon=cursor|' squashfs-root/cursor.desktop
  fi
}

package() {
  local appimage="${srcdir}/cursor-${pkgver}.AppImage"
  local extract_dir="${srcdir}/squashfs-root"
  
  # Install AppImage
  install -Dm755 "$appimage" "${pkgdir}/opt/cursor/cursor.AppImage"

  # Main binary wrapper
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/cursor" <<'EOF'
#!/bin/bash
exec /opt/cursor/cursor.AppImage "$@"
EOF

  # Desktop entry
  if [[ -f "${extract_dir}/cursor.desktop" ]]; then
    install -Dm644 "${extract_dir}/cursor.desktop" \
      "${pkgdir}/usr/share/applications/cursor.desktop"
  fi

  # Icons - install all available sizes
  local icon_dir="${extract_dir}/usr/share/icons/hicolor"
  for size in 16 32 48 64 128 256 512; do
    local icon="${icon_dir}/${size}x${size}/apps/cursor.png"
    [[ -f "$icon" ]] && install -Dm644 "$icon" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cursor.png"
  done
}
