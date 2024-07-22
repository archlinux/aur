# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=music-player
pkgname="lucashazardous-${_pkgname}-bin"
pkgver=2.12.5
_electronversion=26
pkgrel=7
pkgdesc="Desktop Electron app for playing and downloading music."
arch=('x86_64')
url="https://github.com/LucasHazardous/music-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/LucasHazardous/music-player/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3b3ef8988b2365c0baae8a6832bf4985981d24deaa4c97e8fa2c919df93e7cfb'
            '4de62e75233b269ff4b9e1bf7ba805d82bd3cbeab4c204b54043dee4965f849c'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun --no-sandbox|${pkgname%-bin}|g" \
        -e "s|audio;|AudioVideo;|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}