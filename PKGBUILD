# Maintainer: you
pkgname=cursor-appimage
pkgver=2.6.20
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
_commit="b29eb4ee5f9f6d1cb2afbc09070198d3ea6ad76f"

source=(
  "Cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)

sha512sums=('28db11bb6f20489a8a219443b8034e07f0b07f7c9f64cbaf9227705a0ad2e83301cb448ba9d282f9afe666530aff36f8691ff0a946a48b6d1dc9bb61f2924869')

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
