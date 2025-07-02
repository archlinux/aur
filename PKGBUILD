# Maintainer: VCalV
pkgname=electrum-ltc-appimage
pkgver=4.2.2.1
pkgrel=2
pkgdesc="Litecoin wallet (AppImage)"
arch=('x86_64')
url="https://electrum-ltc.org/"
license=('MIT')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=('libxss: for screen saver suspension'
            'gconf: for storing application preferences')
provides=('electrum-ltc')
conflicts=('electrum-ltc' 'electrum-ltc-git')
options=('!strip')

source=("https://electrum-ltc.org/download/electrum-ltc-${pkgver}-x86_64.AppImage"
        "https://electrum-ltc.org/download/electrum-ltc-${pkgver}-x86_64.AppImage.asc")

# GPG key fingerprint for Electrum-LTC
validpgpkeys=('CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA')

sha256sums=('8c27621f87a51baf5b3a492696606a5b55c72b6a9804e3baa8f161cd7cc5d8f5'
            '91719dd7b7b2f6e28766137a50430b755423d99bbc48876d9c73b67325574765')

prepare() {
    # Make AppImage executable
    chmod +x "electrum-ltc-${pkgver}-x86_64.AppImage"
}

package() {
    # Install the AppImage
    install -Dm755 "electrum-ltc-${pkgver}-x86_64.AppImage" \
        "${pkgdir}/opt/electrum-ltc/electrum-ltc-${pkgver}-x86_64.AppImage"
    
    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/electrum-ltc/electrum-ltc-${pkgver}-x86_64.AppImage" \
        "${pkgdir}/usr/bin/electrum-ltc"
    
    # Extract desktop file and icon from AppImage
    cd "${srcdir}"
    ./"electrum-ltc-${pkgver}-x86_64.AppImage" --appimage-extract electrum-ltc.desktop 2>/dev/null || true
    ./"electrum-ltc-${pkgver}-x86_64.AppImage" --appimage-extract electrum-ltc.png 2>/dev/null || true
    
    # Install desktop file from AppImage
    if [ -f "squashfs-root/electrum-ltc.desktop" ]; then
        # Create directory first
        install -dm755 "${pkgdir}/usr/share/applications"
        # Modify the Exec line to use our symlink
        sed 's|^Exec=.*|Exec=electrum-ltc %u|' "squashfs-root/electrum-ltc.desktop" > "${pkgdir}/usr/share/applications/electrum-ltc.desktop"
        chmod 644 "${pkgdir}/usr/share/applications/electrum-ltc.desktop"
    fi
    
    # Install icon from AppImage
    if [ -f "squashfs-root/electrum-ltc.png" ]; then
        install -Dm644 "squashfs-root/electrum-ltc.png" \
            "${pkgdir}/usr/share/pixmaps/electrum-ltc.png"
    fi
    
    # Clean up extracted files
    rm -rf "squashfs-root" 2>/dev/null || true
}
