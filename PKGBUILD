# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechesscontrol-bin
_pkgname=ChineseChessControl
_appname="org.Rabbit.${_pkgname%Control}"
pkgver=2.0.13
pkgrel=3
pkgdesc="Including Chinese chess MFC extension library, Chinese chess activex controls, Chinese chess Qt plugin, artificial intelligence engine, etc(Prebuilt version)"
arch=('x86_64')
url="https://github.com/KangLin/ChineseChessControl"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'qt6-multimedia'
    'qt6-base'
    'qt6-webengine'
    'qt6-scxml'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_Linux_${CARCH}_setup.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('16009e75c9ff725c200a34f967132ab585584f315983358bcbf6fe9a8425ad57'
            'e851b25999d06859cc1551500796ce2fd82dc4bda3c0a29fde2a036028c93bc7')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/ChineseChessApp-v${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/bin\/ChineseChess.sh/${pkgname%-bin}/g
        s/${_appname}/${pkgname%-bin}/g
    " "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}