# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_pkgname=Calendar
_appname="org.Rabbit.${_pkgname}"
pkgver=1.0.16
pkgrel=1
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-scxml'
    'openssl'
    'qt6-base'
    'qt6-webengine'
    'qt6-multimedia'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2721c1bbfe5b2a2af653c45218a5fbfe085714dd9cdcce5419efb46d9fe87ca5'
            'a7a7d76eea59303d476c2691be53a84c9c8ad2a7fa31749ac6f78d7e118ad198')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@apprunname@|${_pkgname}App-v${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${_pkgname}/bin/${_pkgname}.sh|${pkgname%-bin}|g" \
        -e "s|Path=/opt/${_pkgname}|Path=/opt/${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}