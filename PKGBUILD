# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=muffon-bin
pkgver=2.0.1
_electronversion=27
pkgrel=2
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_ghurl="https://github.com/staniel359/muffon"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/staniel359/muffon/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a0e854ced7fab75f610c6e04e683dc7a9e7eaab056328c3119625bf34ebfa3c0'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|Audio;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}