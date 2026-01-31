# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-legacy-bin
_pkgver=1.143.2
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Legacy v1 Desktop version of lobe-chat, keeping local database features"
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=()
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
conflicts=('lobehub-desktop' 'lobe-chat-appimage')
provides=('lobehub-desktop')

source=("lobehub-desktop-beta-1.143.2.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.143.2.x86_64.rpm"
  "LICENSE::https://raw.githubusercontent.com/lobehub/lobe-chat/main/LICENSE"
  "lobehub-desktop-beta.png::https://raw.githubusercontent.com/lobehub/lobe-chat/main/apps/desktop/resources/tray.png")
sha256sums=('c30a5fb124d26a383113715bfb52731e340eed3f19d5ac5ccc73686800df3b77'
  '790a8c42f10beb4f5e9122e05a8e65d5522de49f89ac69cd31063c0f2be93ea4'
  '38e5a907edee6a2188c7f49d6c56688c8c7e110a0dc2ccd6172129372f21efaf')

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/lobehub-desktop-beta-1.143.2.x86_64.rpm"

  # Remove original Beta desktop file
  rm -f "${pkgdir}/usr/share/applications/lobehub-desktop-beta.desktop"
  
  # Create custom Legacy desktop file
  cat > "${srcdir}/lobehub-desktop-legacy.desktop" << 'EOF'
[Desktop Entry]
Name=LobeHub-Legacy
Exec=/opt/LobeHub-Beta/lobehub-desktop-beta %U
Terminal=false
Type=Application
Icon=lobehub-desktop-legacy
StartupWMClass=LobeHub-Legacy
Comment=LobeHub Desktop Application (Legacy v1 with local database)
MimeType=x-scheme-handler/lobehub-legacy;
Categories=Utility;
EOF
  install -Dm644 "${srcdir}/lobehub-desktop-legacy.desktop" "${pkgdir}/usr/share/applications/lobehub-desktop-legacy.desktop"

  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 lobehub-desktop-beta.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lobehub-desktop-legacy.png"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/LobeHub-Beta/lobehub-desktop-beta "${pkgdir}/usr/bin/lobehub-desktop-legacy"
}
