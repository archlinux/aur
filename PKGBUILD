# Maintainer: VoltChat Team <contact@voltagechat.app>
pkgname=volt-desktop
pkgver=1.1.4
pkgrel=1
pkgdesc="VoltChat Desktop Application - Electron-based chat client"
arch=('x86_64')
url="https://voltagechat.app"
license=('custom')
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: system tray support')
provides=('volt-desktop')
conflicts=('volt-desktop-bin')
options=('!strip')

# Source: AppImage from the official update server
source=("${pkgname}-${pkgver}.AppImage::https://updates.voltagechat.app/desktop/linux/Volt-${pkgver}.AppImage"
        "volt-desktop.desktop"
        "volt-desktop.png")
noextract=("${pkgname}-${pkgver}.AppImage")

# Update these sums after running: makepkg -g
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the extracted AppImage contents
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

    # Make the main binary executable
    chmod 755 "${pkgdir}/opt/${pkgname}/volt-desktop" 2>/dev/null || \
    chmod 755 "${pkgdir}/opt/${pkgname}/Volt" 2>/dev/null || true

    # Create a wrapper launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/volt-desktop" << 'EOF'
#!/bin/bash
exec /opt/volt-desktop/volt-desktop "$@" 2>/dev/null || \
exec /opt/volt-desktop/Volt "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/volt-desktop"

    # Install desktop entry
    install -Dm644 "${srcdir}/volt-desktop.desktop" \
        "${pkgdir}/usr/share/applications/volt-desktop.desktop"

    # Install icon
    install -Dm644 "${srcdir}/volt-desktop.png" \
        "${pkgdir}/usr/share/pixmaps/volt-desktop.png"

    # Also try to install icon from extracted AppImage
    if [ -f "${srcdir}/squashfs-root/volt-desktop.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/volt-desktop.png" \
            "${pkgdir}/usr/share/pixmaps/volt-desktop.png"
    elif [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" \
            "${pkgdir}/usr/share/pixmaps/volt-desktop.png"
    fi

    # Register voltchat:// protocol handler
    install -dm755 "${pkgdir}/usr/share/applications"
}
