# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ting_fr
pkgname="eusoft-${_pkgname//_/-}-bin"
_zhsname="每日法语听力"
pkgver=9.7.0
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学法语"
arch=('x86_64')
url="https://www.frdic.com/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_pkgname}" "${_pkgname}")
depends=(
    'hicolor-icon-theme'
    'electron13'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_pkgname}/${_pkgname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('efbf72d55838f72fe4992330092473416476bb32ab6a0d03135aff64f99e74c9'
            '69031e95591a339c4cd9c01547494e23196cea6438608f1f951b493ea8fca54f'
            '0b7771e8972b91d3a37fec8b9751983dc19ce33d0947b5f8b0813ff3e49b32d4')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_zhsname}/${_pkgname}\" %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}