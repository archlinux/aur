# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/omniroute-bin

pkgname=omniroute-bin
pkgver=3.8.21 # renovate: datasource=github-tags depName=diegosouzapw/OmniRoute
pkgrel=1
pkgdesc="OmniRoute desktop app (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/diegosouzapw/OmniRoute"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'libx11' 'libxext' 'nss' 'glib2')
optdepends=('xdg-utils: open links/files with desktop defaults')
conflicts=('omniroute')
provides=('omniroute')
options=('!strip')

source=(
  "OmniRoute-${pkgver}.AppImage::https://github.com/diegosouzapw/OmniRoute/releases/download/v${pkgver}/OmniRoute-${pkgver}.AppImage"
)
sha256sums=('ebeb46a3508af21aaddb0ccb08a6f35b35821d6f275631df4f72feb095254dd7')

prepare() {
  chmod +x "${srcdir}/OmniRoute-${pkgver}.AppImage"
  "${srcdir}/OmniRoute-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/OmniRoute-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/OmniRoute.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/omniroute" <<'EOF'
#!/usr/bin/env bash
exec /opt/omniroute-bin/OmniRoute.AppImage "$@"
EOF

  if [[ -f "${srcdir}/squashfs-root/omniroute.desktop" ]]; then
    install -Dm644 "${srcdir}/squashfs-root/omniroute.desktop" "${pkgdir}/usr/share/applications/omniroute.desktop"
  elif [[ -f "${srcdir}/squashfs-root/OmniRoute.desktop" ]]; then
    install -Dm644 "${srcdir}/squashfs-root/OmniRoute.desktop" "${pkgdir}/usr/share/applications/omniroute.desktop"
  else
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/omniroute.desktop" <<'EOF'
[Desktop Entry]
Name=OmniRoute
Exec=omniroute
Icon=omniroute
Type=Application
Categories=Network;
Terminal=false
EOF
  fi

  if [[ -f "${srcdir}/squashfs-root/omniroute.png" ]]; then
    install -Dm644 "${srcdir}/squashfs-root/omniroute.png" "${pkgdir}/usr/share/pixmaps/omniroute.png"
  elif [[ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/omniroute.png" ]]; then
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/omniroute.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omniroute.png"
  fi
}
