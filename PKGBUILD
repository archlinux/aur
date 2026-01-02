# Maintainer: DonutsDelivery
pkgname=simple-claude-gui-bin
pkgver=1.3.29
pkgrel=1
pkgdesc="A simple GUI for Claude Code CLI - terminal interface for AI-assisted coding"
arch=('x86_64')
url="https://github.com/DonutsDelivery/simple-claude-gui"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
optdepends=('claude-code: Claude Code CLI tool')
provides=('simple-claude-gui')
conflicts=('simple-claude-gui')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/DonutsDelivery/simple-claude-gui/releases/download/v${pkgver}/Simple-Claude-GUI-${pkgver}.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/simple-claude-gui" "${pkgdir}/usr/bin/simple-claude-gui"
    
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/simple-claude-gui.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/simple-claude-gui.png"
    
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/simple-claude-gui.desktop" << DESKTOP
[Desktop Entry]
Name=Simple Claude GUI
Exec=/opt/${pkgname}/simple-claude-gui %U
Icon=simple-claude-gui
Type=Application
Terminal=false
Categories=Development;Utility;
Comment=GUI for Claude Code CLI
DESKTOP
}
