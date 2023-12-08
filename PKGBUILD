# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ytm-dlp
pkgname="${_pkgname}-gui-bin"
pkgver=1.1.0
_electronversion=26
pkgrel=1
pkgdesc="An ElectronJS app for downloading music off Youtube Music."
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('Unlicense')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}-${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/RENOMIZER/ytm-dlp-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f0a97d6c3f187b4be5f3cc8a531de25b3cf80e685621cdd6ce750b9e100db72a'
            '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U||g;s|Audio;|AudioVideo;|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}