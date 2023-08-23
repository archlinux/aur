# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=neanes-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="A free and open source scorewriter for notating Byzantine chant in Byzantine notation."
arch=('x86_64')
url="https://danielgarthur.github.io/neanes/"
_githuburl="https://github.com/danielgarthur/neanes"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Neanes-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('f4d25098e6fa23998c6bae6b074b4ce5fcfdeea5e36e05e6551ace24eb62d9a6'
            '01864517d89189be28ef7502a2185bdf1c309f1949daa272c70a7b5843c7d955')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}