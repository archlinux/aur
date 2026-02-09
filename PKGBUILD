# Maintainer: Luca Popesco <luca@popesco.io>
pkgname=fvtt-desktop-client-bin
_appname=vtt-desktop-client
pkgver=1.13.0
pkgrel=1
pkgdesc="Desktop client for Foundry VTT (JeidoUran Fork)"
arch=('x86_64')
url="https://github.com/JeidoUran/fvtt-player-client"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'alsa-lib' 'nss' 'atk' 'libdrm' 'libxcomposite' 'libxrandr' 'mesa')
options=('!strip')

# Dynamic filename for the JeidoUran release
_filename="FVTT-Desktop-Client_${pkgver}_linux-x86_64.AppImage"

# Programmatic source
source=("app.AppImage::${url}/releases/download/${pkgver}/${_filename}")
sha256sums=('ace2e86fd85d579b1a1317ac8951b8e8f12ecbe016ec7bbc03d90b07d03fd556')

prepare() {
    chmod +x "app.AppImage"
    ./app.AppImage --appimage-extract
}

package() {
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    install -d -m755 "${pkgdir}/usr/bin"

    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"
    
    chmod 755 -R "${pkgdir}/opt/${pkgname}"

    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    sed -i "s|Exec=AppRun|Exec=${pkgname}|g" "${srcdir}/squashfs-root/${_appname}.desktop"
    sed -i "s|Icon=${_appname}|Icon=${pkgname}|g" "${srcdir}/squashfs-root/${_appname}.desktop"
    
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
