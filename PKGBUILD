# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fdc3-sail-bin"
pkgver=22.12.6.1030
_appver=22.12.6-1030
pkgrel=1
pkgdesc="Open implementation of the FDC3 standard using Electron and an integrated App Directory."
arch=('x86_64')
url="https://github.com/finos/FDC3-Sail"
license=('Apache')
conflicts=("${pkgname%-bin}")
depends=('electron24' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${_appver}/FDC3-Sail-${_appver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('81243023ba6af8562e5244f6d48f2e4dd8f17ab77984dda7a55ad0863959ea97'
            'fdc1caaf3e4f54c9a4dd60923e35e521a31884ae39b2dd0291b85baaba899ff7')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}