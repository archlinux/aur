# Maintainer: Daniel Oltmanns <arch@oltdaniel.eu>

pkgname=rancher-desktop-bin
pkgver=1.20.0
pkgrel=1
pkgdesc='Rancher Desktop is an open-source project to bring Kubernetes and container management to the desktop'
arch=('x86_64')
url='https://rancherdesktop.io/'
license=('Apache')
depends=('qemu')
makedepends=('imagemagick')
provides=('rancher-desktop' 'docker' 'helm' 'kubectl' 'nerdctl' 'limactl')
conflicts=('rancher-desktop')
source=("rancher-desktop-linux-v${pkgver}.zip::https://github.com/rancher-sandbox/rancher-desktop/releases/download/v${pkgver}/rancher-desktop-linux-v${pkgver}.zip")
sha512sums=('b1c3038e036ad567d43cd7c34fd3ca2ce1e4c5d63b0c7bd8048b27f066bb74195c54fa98a3cb65ecd80d60f20cd7c6877731e33f032e9a3eba57a7e9257b8503')

prepare() {
    # Generate icons
    icon="${srcdir}/resources/resources/icons/logo-square-512.png"

    if [ -n "$icon" ] && [ -f "$icon" ]; then
        mkdir -p "${srcdir}/share/icons/hicolor"
        for size in 512x512 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
            mkdir -p "${srcdir}/share/icons/hicolor/${size}/apps"
            magick "$icon" -resize "${size}" "${srcdir}/share/icons/hicolor/${size}/apps/rancher-desktop.png"
        done
    else
        echo "Warning: Icon not found, icons will not be generated"
    fi
}

package() {
    # Install application files
    install -d "$pkgdir/opt/${pkgname}"
    cp -r "${srcdir}"/* "$pkgdir/opt/${pkgname}/"
    
    # Remove the share directory from opt (we'll install it properly)
    rm -rf "$pkgdir/opt/${pkgname}/share"
    
    # Set proper permissions for executable files
    chmod 755 "$pkgdir/opt/${pkgname}/rancher-desktop"
    chmod 755 "$pkgdir/opt/${pkgname}/chrome_crashpad_handler"
    chmod 4755 "$pkgdir/opt/${pkgname}/chrome-sandbox"
    
    # Install desktop file from resources
    if [ -f "$pkgdir/opt/${pkgname}/resources/resources/linux/rancher-desktop.desktop" ]; then
        install -Dm644 "$pkgdir/opt/${pkgname}/resources/resources/linux/rancher-desktop.desktop" \
            -t "$pkgdir/usr/share/applications"
    fi
    
    # Install AppData file
    if [ -f "$pkgdir/opt/${pkgname}/resources/resources/linux/rancher-desktop.appdata.xml" ]; then
        install -Dm644 "$pkgdir/opt/${pkgname}/resources/resources/linux/rancher-desktop.appdata.xml" \
            -t "$pkgdir/usr/share/metainfo"
    fi
    
    # Install generated icons
    if [ -d "${srcdir}/share/icons/hicolor" ]; then
        install -d "$pkgdir/usr/share/icons/hicolor/"
        cp -r "${srcdir}/share/icons/hicolor"/* "$pkgdir/usr/share/icons/hicolor/"
    fi
    
    # Create symlink in /usr/bin
    install -d "$pkgdir/usr/bin/"
    ln -sf "/opt/${pkgname}/rancher-desktop" "$pkgdir/usr/bin/rancher-desktop"
    
    # Install license files
    install -Dm644 "${srcdir}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
