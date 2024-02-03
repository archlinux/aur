# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=media-hoarder-bin
_pkgname="Media Hoarder"
pkgver=1.3.3
_electronversion=13
pkgrel=1
pkgdesc="The media frontend for data hoarders and movie lovers"
arch=('x86_64')
url="https://github.com/theMK2k/Media-Hoarder"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/theMK2k/Media-Hoarder/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('e08ceeb33a25f3cfd2e0e35d291255722d328d3ecbba260fced071953a508d44'
            '3c67fce0428a3d133bb589cd1db329789ec235049af1412511f89420c99ae9a6'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|data\/media-hoarder.db_initial|..\/..\/media-hoarder\/data/media-hoarder.db_initial|g" -i "${srcdir}/app.asar.unpacked/js/app.6fe6a6b5.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/data/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/data"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"3
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 180x180 192x192 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}