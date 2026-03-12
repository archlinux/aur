# Maintainer: DJZeroAction <your-email@example.com>
pkgname=bitwig-theme-manager-bin
pkgver=0.2.29
pkgrel=1
pkgdesc="A cross-platform desktop application for managing and editing Bitwig Studio themes"
arch=('x86_64')
url="https://github.com/DJZeroAction/bitwig-theme-manager"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'fuse2')
provides=('bitwig-theme-manager')
conflicts=('bitwig-theme-manager')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/DJZeroAction/bitwig-theme-manager/releases/latest/download/Bitwig.Theme.Manager_amd64.AppImage"
        "bitwig-theme-manager.desktop")
sha256sums=('SKIP'
            'SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/bitwig-theme-manager/bitwig-theme-manager.AppImage"

    # Extract and install icon
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/bitwig-theme-manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/bitwig-theme-manager.png" 2>/dev/null || \
    install -Dm644 "${srcdir}/squashfs-root/bitwig-theme-manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/bitwig-theme-manager.png" 2>/dev/null || true

    # Install desktop file
    install -Dm644 "${srcdir}/bitwig-theme-manager.desktop" "${pkgdir}/usr/share/applications/bitwig-theme-manager.desktop"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/bitwig-theme-manager" << 'EOF'
#!/bin/bash
exec /opt/bitwig-theme-manager/bitwig-theme-manager.AppImage "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/bitwig-theme-manager"
}
