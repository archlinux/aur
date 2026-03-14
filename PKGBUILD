# Maintainer: Plutophotos <support at plutophotos dot com>
pkgname=pluto-photos-bin
pkgver=2.3.11
pkgrel=1
pkgdesc='Desktop photo library manager with face detection, smart albums, map view, and cloud import'
arch=('x86_64')
url='https://plutophotos.com'
license=('LicenseRef-Proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('pluto-photos')
conflicts=('pluto-photos')
options=(!strip !debug)
_appimage="pluto-photos-${pkgver}.AppImage"
source=("${_appimage}::https://plutophotos.com/downloads/${_appimage}"
        'pluto-photos.desktop')
sha256sums=('8dae778bb08358b823cba4633440ef0c1bc6eeb0ed1c4885afc7ac405d9b3447'
            '39dbd52edef2592f66dfb7fbbf471b62f547457288565e23759584f74606b46b')
noextract=("${_appimage}")

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    cd "${srcdir}"
    ./"${_appimage}" --appimage-extract
}

package() {
    cd "${srcdir}"

    # Install app to /opt
    install -d "${pkgdir}/opt/pluto-photos"
    cp -r squashfs-root/* "${pkgdir}/opt/pluto-photos/"

    # Fix permissions
    find "${pkgdir}/opt/pluto-photos" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/pluto-photos" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/pluto-photos/pluto-photos"
    chmod 4755 "${pkgdir}/opt/pluto-photos/chrome-sandbox"

    # Make shared libraries executable
    find "${pkgdir}/opt/pluto-photos" -name '*.so*' -exec chmod 755 {} +

    # Launcher symlink
    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/pluto-photos/pluto-photos "${pkgdir}/usr/bin/pluto-photos"

    # Desktop entry
    install -Dm644 "${srcdir}/pluto-photos.desktop" \
        "${pkgdir}/usr/share/applications/pluto-photos.desktop"

    # Icons from extracted AppImage
    for size in 16 32 48 64 128 256 512 1024; do
        _icon="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/pluto-photos.png"
        if [ -f "${_icon}" ]; then
            install -Dm644 "${_icon}" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/pluto-photos.png"
        fi
    done
}
