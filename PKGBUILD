# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_de
pkgname="eusoft-${_appname//_/-}-bin"
_zhname="每日德语听力"
pkgver=9.7.0
_electronversion=11
pkgrel=5
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学德语"
arch=('x86_64')
url="https://www.godic.net/ting"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "eudic-${_appname//_/-}"
    "${_appname//_/-}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html::https://www.eudic.net/v4/en/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('3bf27e84f6b6f65aad0bbb45b8602afb9124cd2539c62406d9b9c8f2bfa7249d'
            '12ec1b3e4be99eee9c2d5fb55c196d2294c1b112e137927c61f81efb0e308f75'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_zhname}/${_appname}\"|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}