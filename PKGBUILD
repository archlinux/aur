# Maintainer: kaizen403 <kaizen403@proton.me>
pkgname=openlinear-bin
pkgver=0.1.33
pkgrel=1
pkgdesc="AI-powered project management that actually writes the code — desktop app"
arch=('x86_64')
url="https://github.com/kaizen403/openlinear"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
optdepends=(
  'libappindicator-gtk3: system tray support'
  'xdg-utils: open links in browser'
)
provides=('openlinear')
conflicts=('openlinear')
options=('!strip' '!debug')
source=(
  "openlinear-${pkgver}-x86_64.AppImage::https://github.com/kaizen403/openlinear/releases/download/v${pkgver}/openlinear-${pkgver}-x86_64.AppImage"
  "openlinear.desktop"
  "openlinear.png::https://raw.githubusercontent.com/kaizen403/openlinear/v${pkgver}/apps/desktop/src-tauri/icons/icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # Install AppImage
  install -Dm755 "${srcdir}/openlinear-${pkgver}-x86_64.AppImage" \
    "${pkgdir}/opt/openlinear/openlinear.AppImage"

  # Install wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/openlinear" << 'EOF'
#!/usr/bin/env bash
# Detect Wayland session and set appropriate flags
if [ "${XDG_SESSION_TYPE}" = "wayland" ] || [ -n "${WAYLAND_DISPLAY}" ]; then
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
  export APPIMAGE_EXTRACT_AND_RUN=1
else
  export WEBKIT_DISABLE_COMPOSITING_MODE=1
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
  export APPIMAGE_EXTRACT_AND_RUN=1
fi
nohup /opt/openlinear/openlinear.AppImage "$@" > /dev/null 2>&1 &
disown
EOF
  chmod 755 "${pkgdir}/usr/bin/openlinear"

  # Install desktop entry
  install -Dm644 "${srcdir}/openlinear.desktop" \
    "${pkgdir}/usr/share/applications/openlinear.desktop"

  # Install icon
  install -Dm644 "${srcdir}/openlinear.png" \
    "${pkgdir}/usr/share/pixmaps/openlinear.png"
  install -Dm644 "${srcdir}/openlinear.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openlinear.png"
}
