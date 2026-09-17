# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=cursor-appimage
pkgver=3.21.9
pkgrel=1
_ver=3.21
_commit="9998796a6096ce83d83a9332bfe7473b985db750"
pkgdesc="Cursor AI code editor (AppImage, extracted)"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom')
depends=('glibc' 'gtk3' 'nss' 'libxss' 'alsa-lib')
conflicts=('cursor-bin')
provides=('cursor')
options=(!strip)
_watch=(
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/${_ver}' 'header' 'regex' 'Cursor-([0-9.]+)-x86_64.AppImage' 'pkgver'
  'https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/${_ver}' 'header' 'regex' 'location:.*production/([a-f0-9]+)/' '_commit'
)

source=(
  "Cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)

sha512sums=('095c0c43c5f3ea2e23bd9e9b8a969570729497ffcd47cc9210d8fffd095877a6fd05e43a6e23b23f00458202c4a6160eefa2a37e2b7d3c8083c89625cff18784')

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
