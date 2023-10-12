# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=music-player
pkgname="lucashazardous-${_appname}-bin"
pkgver=2.12.5
pkgrel=1
pkgdesc="Desktop Electron app for playing and downloading music."
arch=('x86_64')
url="https://github.com/LucasHazardous/music-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/LucasHazardous/music-player/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('3b3ef8988b2365c0baae8a6832bf4985981d24deaa4c97e8fa2c919df93e7cfb'
            '4de62e75233b269ff4b9e1bf7ba805d82bd3cbeab4c204b54043dee4965f849c'
            'c6badf0075ca9889e909ab1276c36653934f6ab863779a8bbe5aa304cc7a55a4')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" \
        -e "s|audio;|AudioVideo;|g" \
        -e "s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}