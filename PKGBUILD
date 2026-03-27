# Maintainer: Regaan <contact@rothackers.com>

pkgname=wshawk
pkgver=4.0.0
pkgrel=2
pkgdesc="Enterprise-grade WebSocket Security Scanner & Web Pentest Toolkit"
arch=('x86_64')
url="https://wshawk.rothackers.com"
license=('AGPL3')
depends=('hicolor-icon-theme' 'libglvnd' 'zlib')
provides=('wshawk')
source=("wshawk-${pkgver}.AppImage::https://github.com/regaan/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    chmod +x "${srcdir}/wshawk-${pkgver}.AppImage"

    "${srcdir}/wshawk-${pkgver}.AppImage" --appimage-extract

    chmod -R a+rX squashfs-root
    chmod 755 squashfs-root/AppRun
    chmod 4755 squashfs-root/chrome-sandbox || true

    install -d "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/wshawk"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/wshawk/AppRun" "${pkgdir}/usr/bin/wshawk"
    ln -sf "/opt/wshawk/AppRun" "${pkgdir}/usr/bin/wshawk-desktop"

    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/wshawk.desktop" <<EOF
[Desktop Entry]
Name=WSHawk
Comment=Enterprise-grade WebSocket Security Scanner & Web Pentest Toolkit
Exec=/usr/bin/wshawk
Icon=wshawk
Terminal=false
Type=Application
Categories=Development;Security;Network;
StartupWMClass=WSHawk
EOF

    if [[ -f "${pkgdir}/opt/wshawk/wshawk.png" ]]; then
        install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
        install -Dm644 "${pkgdir}/opt/wshawk/wshawk.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wshawk.png"
    elif [[ -f "${pkgdir}/opt/wshawk/.DirIcon" ]]; then
        install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
        install -Dm644 "${pkgdir}/opt/wshawk/.DirIcon" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wshawk.png"
    fi
}