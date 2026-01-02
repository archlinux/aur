# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=cursor-appimage
pkgver=2.3.18
pkgrel=1
pkgdesc="AI-first coding environment (AppImage version)"
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
depends=('fuse2' 'xdg-utils' 'hicolor-icon-theme')
conflicts=('cursor-bin')
options=(!strip)
_watch=(
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.3' 'header' 'regex' 'Cursor-([0-9.]+)-x86_64.AppImage' 'pkgver'
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.3' 'header' 'regex' 'location:.*production/([a-f0-9]+)/' '_commit'
)
_commit="df371ac0d93fe1a68d05eeb59a09c5c39add0c89"

source=(
  "cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)
sha512sums=('f8b746e2e0af79a107eb56e0c2469cca7d33d5fd4376f874ee908640fb5b2a016b8e5bb1959a61028d2d878b59083a0e51ca0aa61b72c2c7c7fb6f640d4bc384')

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
