# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fdc3-sail-bin
_pkgname=FDC3-Sail
pkgver=22.12.6_1030
pkgrel=3
pkgdesc="Open implementation of the FDC3 standard using Electron and an integrated App Directory."
arch=('x86_64')
url="https://github.com/finos/FDC3-Sail"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('81243023ba6af8562e5244f6d48f2e4dd8f17ab77984dda7a55ad0863959ea97'
            '8de54674265f1c1b58fad8c858b1b9d10aa91fdfcb7cd498f7548cf49d26559b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}