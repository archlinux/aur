# Maintainer: you
pkgname=cursor-appimage
pkgver=2.6.18
pkgrel=1
pkgdesc="Cursor AI code editor (AppImage, extracted)"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom')
depends=('glibc' 'gtk3' 'nss' 'libxss' 'alsa-lib')
options=(!strip)
_watch=(
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.7' 'header' 'regex' 'Cursor-([0-9.]+)-x86_64.AppImage' 'pkgver'
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.7' 'header' 'regex' 'location:.*production/([a-f0-9]+)/' '_commit'
)
_commit="68fbec5aed9da587d1c6a64172792f505bafa252"

source=(
  "Cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)

sha512sums=('366d1f03932bce59b39e2b7d44c6046b50ec2bb8d3ad03dc922e693e79635513e6a60a5f0b09e8b29a225050913a0c4add438b19664ccf9248bde6bd2fec806b')

prepare() {
  cd "${srcdir}"
  chmod +x Cursor-${pkgver}.AppImage
  ./Cursor-${pkgver}.AppImage --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/cursor"
  cp -a squashfs-root/* "${pkgdir}/opt/cursor/"

  # --- FIX APPIMAGE ---
  # Replace broken AppRun with working launcher
  cat > "${pkgdir}/opt/cursor/AppRun" <<'EOF'
#!/bin/bash
HERE="$(cd "$(dirname "$0")" && pwd)"

export PATH="$HERE/usr/bin:$PATH"
export LD_LIBRARY_PATH="$HERE/usr/lib:$HERE/usr/lib64:$HERE/lib:$LD_LIBRARY_PATH"
export XDG_DATA_DIRS="$HERE/usr/share:$XDG_DATA_DIRS"

exec "$HERE/usr/share/cursor/cursor" "$@"
EOF

  chmod +x "${pkgdir}/opt/cursor/AppRun"

  # chrome sandbox (required by Electron)
  if [[ -f "${pkgdir}/opt/cursor/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/cursor/chrome-sandbox"
  fi

  # CLI launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/cursor" <<'EOF'
#!/bin/bash
exec /opt/cursor/AppRun "$@"
EOF

  # Desktop entry
  install -Dm644 squashfs-root/cursor.desktop \
    "${pkgdir}/usr/share/applications/cursor.desktop"

  sed -i 's|^Exec=.*|Exec=cursor %F|' \
    "${pkgdir}/usr/share/applications/cursor.desktop"

  sed -i 's|^Icon=.*|Icon=cursor|' \
    "${pkgdir}/usr/share/applications/cursor.desktop"

  # Icons
  for size in 16 32 48 64 128 256 512; do
    icon="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/cursor.png"
    [[ -f "$icon" ]] && install -Dm644 "$icon" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cursor.png"
  done
}
