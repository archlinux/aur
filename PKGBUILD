# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdownloader-gui-bin
_pkgname=YTDownloader
pkgver=3.16.1
_electronversion=27
pkgrel=1
pkgdesc="A modern GUI App for downloading Videos and Audios from hundreds of sites."
arch=('x86_64')
url="https://ytdn.netlify.app/"
_ghurl="https://github.com/aandrew-me/ytDownloader"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_Linux.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('064169b8ece9c6666aaa537bdf29888c1b073865645c8bebc40be9a0907fc354'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_pkgname}/${pkgname%-gui-bin}|${pkgname%-bin}|g;s|Icon=${pkgname%-gui-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 64x64 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-gui-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}