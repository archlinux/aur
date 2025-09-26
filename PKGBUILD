# Maintainer: Your Name <your.email@example.com>
pkgname=cc-switch-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="CC Switch - A utility application for switching between different configurations"
arch=('x86_64')
url="https://github.com/farion1231/cc-switch"
license=('mit')
depends=('gtk3' 'hicolor-icon-theme')
optdepends=('appmenu-gtk3-module: to reduce GTK module warnings')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/farion1231/cc-switch/releases/download/v${pkgver}/CC.Switch_${pkgver}_amd64.AppImage"
        "cc-switch.desktop"
        "cc-switch.png")
sha256sums=('fc34ff065cdb7365785baebf480ca52411307fb3b0327c79abdf923ea480626f'
            'ac408c8b0d8113bd0cb6e4868ca753038142e2e60e2d22f9a291b03b30fa1c8a'
            'd19349e7d3e17540d573fa458544145449106799d0d71de52294d60f629f4656')
noextract=("${pkgname}-${pkgver}.AppImage")

package() {
    # Create installation directory
    install -dm755 "${pkgdir}/opt/cc-switch"

    # Install AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/cc-switch/cc-switch.AppImage"

    # Create wrapper script
    install -dm755 "${pkgdir}/opt/cc-switch"
    cat > "${pkgdir}/opt/cc-switch/cc-switch-wrapper.sh" << 'EOF'
#!/usr/bin/env bash
# CC Switch warpper
export GTK_MODULES=""
export NO_AT_BRIDGE=1
exec /opt/cc-switch/cc-switch.AppImage "$@"
EOF
    chmod +x "${pkgdir}/opt/cc-switch/cc-switch-wrapper.sh"

    # Install icon
    install -Dm644 "${srcdir}/cc-switch.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cc-switch.png"

    # Install desktop file
    install -Dm644 "${srcdir}/cc-switch.desktop" "${pkgdir}/usr/share/applications/cc-switch.desktop"
    # Update Exec path in desktop file to use wrapper
    sed -i 's|Exec=.*|Exec=/opt/cc-switch/cc-switch-wrapper.sh|' "${pkgdir}/usr/share/applications/cc-switch.desktop"

    # Create symlink for command line usage
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/cc-switch/cc-switch-wrapper.sh" "${pkgdir}/usr/bin/cc-switch"
}
