# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_de
pkgname="eusoft-${_appname//_/-}-bin"
_zhname="每日德语听力"
pkgver=9.6.2.114
pkgrel=2
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学德语"
arch=('x86_64')
url="https://www.godic.net/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname//_/-}" "${_appname//_/-}")
depends=('hicolor-icon-theme' 'bash' 'electron13')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('3bf27e84f6b6f65aad0bbb45b8602afb9124cd2539c62406d9b9c8f2bfa7249d'
            'ca6b558863398cad1363bf850881d318dac47866dc2ba75353364c0de5615525'
            '6aae6ebadeecf62c0766453d1cc211a872897d112f56a64efafa15ca87473127')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_zhname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_zhname}/${_appname}\" %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}