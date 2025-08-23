# Maintainer: lone-cloud <hoboman313@proton.me>
pkgname=friendly-kobold
pkgver=0.5.3
pkgrel=1
pkgdesc="A modern Electron shell for KoboldCpp"
arch=('x86_64')
url="https://github.com/lone-cloud/friendly-kobold"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib')
optdepends=('koboldcpp: AI language model backend')
provides=('friendly-kobold')
conflicts=('friendly-kobold-git')
source=("friendly-kobold-${pkgver}.AppImage::https://github.com/lone-cloud/friendly-kobold/releases/download/v0.5.3/Friendly%20Kobold-0.5.3.AppImage")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

prepare() {
    chmod +x "friendly-kobold-${pkgver}.AppImage"
    "./friendly-kobold-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the application
    install -dm755 "${pkgdir}/opt/friendly-kobold"
    cp -r squashfs-root/* "${pkgdir}/opt/friendly-kobold/"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/friendly-kobold" << 'WRAPPER'
#!/bin/bash
exec /opt/friendly-kobold/friendly-kobold "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/friendly-kobold"
    
    # Install desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/friendly-kobold.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Friendly Kobold
Comment=A modern Electron shell for KoboldCpp
Exec=friendly-kobold %U
Terminal=false
Type=Application
Icon=friendly-kobold
Categories=Development;Utility;
StartupWMClass=Friendly Kobold
DESKTOP
    
    # Install icon
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    if [ -f "${pkgdir}/opt/friendly-kobold/resources/assets/icon.png" ]; then
        cp "${pkgdir}/opt/friendly-kobold/resources/assets/icon.png" "${pkgdir}/usr/share/pixmaps/friendly-kobold.png"
    fi
}
