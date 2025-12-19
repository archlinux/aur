# Maintainer: EbadiDev <archnet@duck.com>
pkgname=archnet-bin
pkgver=0.9.26
pkgrel=1
pkgdesc="A VPN GUI client supporting v2ray, xray, sing-box, clash, and mihomo cores"
arch=('x86_64')
url="https://github.com/ArchNets/ArchNet-app"
license=('custom')
depends=('gtk3' 'libsecret')
optdepends=(
    'libayatana-appindicator: for system tray support'
)
provides=('archnet')
conflicts=('archnet')
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/ArchNets/ArchNet-app/releases/download/v${pkgver}+${pkgrel}/archnet-linux.zip"
    "archnet.desktop"
    "archnet.sh"
)
sha256sums=('1a5ba4129b3a32a8032f53632eb5445bf02dd294961e23359512d8af31ed6f91'
            'b23a236988a94cc8373fa6505cdf7ea6e247570d04f238463d160b37917723c6'
            '290420620f618e7cb4e423749f2bfb0e7cb8afdb4f6c5e5c494c55b4889c0fc2')

package() {
    # Install the application to /opt
    install -dm755 "${pkgdir}/opt/archnet"
    cp -r "${srcdir}/archnet-linux/"* "${pkgdir}/opt/archnet/"
    
    # Install the launcher script
    install -Dm755 "${srcdir}/archnet.sh" "${pkgdir}/usr/bin/archnet"
    
    # Install desktop file
    install -Dm644 "${srcdir}/archnet.desktop" "${pkgdir}/usr/share/applications/archnet.desktop"
    
    # Install icon (extracted from the bundle)
    if [ -f "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon.png" ]; then
        install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon.png" \
            "${pkgdir}/usr/share/pixmaps/archnet.png"
    elif [ -f "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon_rounded_square.png" ]; then
        install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon_rounded_square.png" \
            "${pkgdir}/usr/share/pixmaps/archnet.png"
    fi
    
    # Install license (all rights reserved as per README)
    install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
    
    # Set executable permissions
    chmod +x "${pkgdir}/opt/archnet/archnet"
    
    # Set executable permissions for bundled binaries
    chmod +x "${pkgdir}/opt/archnet/lib/sing-box" 2>/dev/null || true
    chmod +x "${pkgdir}/opt/archnet/lib/libv2raycore.so" 2>/dev/null || true
}
