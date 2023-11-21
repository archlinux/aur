# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_pkgname=Calendar
_appname="org.Rabbit.${_pkgname}"
pkgver=1.0.13
pkgrel=2
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-scxml'
    'openssl'
    'bash'
    'qt6-base'
    'qt6-webengine'
    'qt6-multimedia'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('0033af5085f60c67ba5a0d10dab1c7a2d4d7e3be61d06a702be6ed820d05f907'
            'ec1630028322ebde4ae009be7b1f6d12e503b814209bd1144c7b81e6c5400673')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${_pkgname}/bin/${_pkgname}.sh|${pkgname%-bin}|g" \
        -e "s|Path=/opt/${_pkgname}|Path=/opt/${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
    sed "s|#Path=log|Path=${HOME}/.config/${pkgname%-bin}/log|g" -i "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.conf"
    cp "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.conf" "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.ini"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}