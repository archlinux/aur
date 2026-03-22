pkgname=ayais-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Cross-platform desktop app for AI website integration"
arch=('x86_64')
url="https://github.com/marmotz/ayais"
license=('MIT')
depends=('gtk3' 'libappindicator-gtk3')
source=("https://github.com/marmotz/ayais/releases/download/v${pkgver}/AyAIs-${pkgver}.AppImage")
sha256sums=("f516db165b05c896cb41024e893ae4c75060c7bba212c409a35b686f707c1ea0")

package() {
    cd "${srcdir}"
    chmod +x AyAIs-${pkgver}.AppImage
    ./AyAIs-${pkgver}.AppImage --appimage-extract

    install -dm755 "${pkgdir}/opt/ayais"
    cp -r squashfs-root/* "${pkgdir}/opt/ayais/"

    find "${pkgdir}/opt/ayais" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/ayais" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/ayais/ayais"
    chmod 755 "${pkgdir}/opt/ayais/chrome-sandbox"
    chmod 755 "${pkgdir}/opt/ayais/chrome_crashpad_handler"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/ayais/ayais "${pkgdir}/usr/bin/ayais"

    install -Dm644 squashfs-root/ayais.desktop "${pkgdir}/usr/share/applications/ayais.desktop"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/ayais.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ayais.png"

    sed -i "s|Exec=.*|Exec=ayais|" "${pkgdir}/usr/share/applications/ayais.desktop"
}
