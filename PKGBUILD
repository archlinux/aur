# Maintainer: you
pkgname=cursor-appimage
pkgver=2.6.14
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
_commit="eb1c4e0702d201d1226d2a7afb25c501c2e56088"

source=(
  "Cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)

sha512sums=('7dc93f2c6c7571e046bb328607214ffab7c784c9bc56e728cb8c0e37a9441f0dba818ea33bfd1e67238ab8c7fccf3f8b69adba1c9aa9ae4f69d476475d42377a')

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
