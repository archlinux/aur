# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=cursor-appimage
pkgver=2.3.40
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
_commit="230922a103262db3487b753c8d1e0a7111c2d78c"

source=(
  "cursor-${pkgver}.AppImage::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage"
)
sha512sums=('264f74cb4715f61aee5553b8d2b34469e231970debb18c3a1e813bf6bbf83968ff35b24dce624c6dec90bd7e05208e8272bd94f48f9d399c78cbe927b04655dd')

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
