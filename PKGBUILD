# Maintainer: DonutsDelivery
pkgname=simple-code-gui-bin
pkgver=1.3.58
pkgrel=1
pkgdesc="Multi-backend AI coding assistant GUI supporting Claude Code, Gemini CLI, Codex, OpenCode, and Aider"
arch=('x86_64')
url="https://github.com/DonutsDelivery/simple-code-gui"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
optdepends=(
    'claude-code: Claude Code CLI tool'
    'gemini-cli: Google Gemini CLI tool'
    'aider: AI pair programming tool'
)
provides=('simple-code-gui')
conflicts=('simple-code-gui')
options=('!strip')
_appname="Simple-Claude-GUI"
source=("${pkgname}-${pkgver}.AppImage::https://github.com/DonutsDelivery/simple-code-gui/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"

    # The AppImage binary is named simple-claude-gui internally
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/simple-claude-gui" "${pkgdir}/usr/bin/simple-code-gui"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/simple-claude-gui.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/simple-code-gui.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/simple-code-gui.desktop" << DESKTOP
[Desktop Entry]
Name=Simple Code GUI
Exec=/opt/${pkgname}/simple-code-gui %U
Icon=simple-code-gui
Type=Application
Terminal=false
Categories=Development;IDE;
Comment=Multi-backend AI coding assistant GUI
Keywords=claude;terminal;ai;code;gemini;aider;codex;
StartupWMClass=simple-code-gui
DESKTOP
}
