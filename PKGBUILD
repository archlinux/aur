# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_en
pkgname="eusoft-${_appname//_/-}-bin"
_zhname="每日英语听力"
pkgver=9.6.2.114
pkgrel=2
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="http://dict.eudic.net/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('47b4bd3aa25299fa835f7141e370aa679f938ce573a367418ad2d4ac2aa3a99c'
            '17651cf7ae49b0372b6b6812d8b3b066203892c9fbe0b04b25efec0ab038c12b'
            'd45e14c72d6b0369e835f65435df5804334c50ea5d2d518244e0ca72fc09daaf')
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