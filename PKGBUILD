# Maintainer: lone-cloud <hoboman313@proton.me>
pkgname=friendly-kobold
pkgver=0.6.2
pkgrel=2
pkgdesc="A desktop app for running Large Language Models locally"
arch=('x86_64')
url="https://github.com/lone-cloud/friendly-kobold"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss')
optdepends=('alsa-lib: Audio support for sound effects'
           'libxss: Screen saver detection support')
provides=('friendly-kobold')
conflicts=('friendly-kobold-git')
source=("friendly-kobold-${pkgver}.AppImage::https://github.com/lone-cloud/friendly-kobold/releases/download/v0.6.2/Friendly.Kobold-0.6.2.AppImage"
        "friendly-kobold.desktop::https://raw.githubusercontent.com/lone-cloud/friendly-kobold/v0.6.2/assets/friendly-kobold.desktop")
sha256sums=('90301d3731bfa819472f8137a0f2b4688e1f5a508377420a759e5d1be38cd3f5'
            'faa15709dd546ba46cd8fe0daf488c1fc3f6f13fdcc926b3dea140743f85dad8')

prepare() {
    chmod +x "friendly-kobold-${pkgver}.AppImage"
    "./friendly-kobold-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the application
    install -dm755 "${pkgdir}/opt/friendly-kobold"
    cp -r squashfs-root/* "${pkgdir}/opt/friendly-kobold/"
    
    # Fix permissions on extracted files
    chmod -R 755 "${pkgdir}/opt/friendly-kobold/"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/friendly-kobold" << 'WRAPPER'
#!/bin/bash
exec "/opt/friendly-kobold/Friendly Kobold" "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/friendly-kobold"
    
    # Install desktop file from assets
    install -dm755 "${pkgdir}/usr/share/applications"
    cp "${srcdir}/friendly-kobold.desktop" "${pkgdir}/usr/share/applications/"
    
    # Install icon to hicolor theme directory and pixmaps as fallback
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    
    # Try different possible icon locations
    if [ -f "${pkgdir}/opt/friendly-kobold/resources/assets/icon.png" ]; then
        cp "${pkgdir}/opt/friendly-kobold/resources/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/friendly-kobold.png"
        cp "${pkgdir}/opt/friendly-kobold/resources/assets/icon.png" "${pkgdir}/usr/share/pixmaps/friendly-kobold.png"
    elif [ -f "${pkgdir}/opt/friendly-kobold/assets/icon.png" ]; then
        cp "${pkgdir}/opt/friendly-kobold/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/friendly-kobold.png"
        cp "${pkgdir}/opt/friendly-kobold/assets/icon.png" "${pkgdir}/usr/share/pixmaps/friendly-kobold.png"
    elif [ -f "${pkgdir}/opt/friendly-kobold/icon.png" ]; then
        cp "${pkgdir}/opt/friendly-kobold/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/friendly-kobold.png"
        cp "${pkgdir}/opt/friendly-kobold/icon.png" "${pkgdir}/usr/share/pixmaps/friendly-kobold.png"
    else
        echo "Warning: Could not find icon.png in expected locations"
    fi
}
