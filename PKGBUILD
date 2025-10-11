# Maintainer: Max Trewhitt <max@trewhitt.au>
pkgname=devwp-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="An Electron-based desktop application for managing local WordPress development sites"
arch=('x86_64')
url="https://github.com/SpiZeak/DevWP"
license=('custom')
depends=('docker' 'docker-compose' 'gtk3' 'nss' 'alsa-lib')
optdepends=(
    'docker-buildx: For building custom Docker images'
    'git: For version control integration'
)
provides=('devwp')
conflicts=('devwp')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/devwp-${pkgver}.AppImage")
sha256sums=('aff99a2d3e6174ffbb585066fb83754abdc1d1de89836ff74ac45537b6c93ced')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install main application files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"

    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/devwp" << 'EOF'
#!/bin/bash
exec /opt/devwp-bin/AppRun "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/devwp"

    # Install desktop file
    install -Dm644 squashfs-root/devwp.desktop \
        "${pkgdir}/usr/share/applications/devwp.desktop"

    # Fix Exec path in desktop file
    sed -i 's|Exec=AppRun|Exec=/usr/bin/devwp|g' \
        "${pkgdir}/usr/share/applications/devwp.desktop"

    # Install icon
    for size in 16 32 48 64 128 256 512; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png"
        fi
    done

    # Install license if available
    if [ -f "squashfs-root/LICENSE" ]; then
        install -Dm644 squashfs-root/LICENSE \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
