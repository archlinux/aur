# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_es
pkgname="eusoft-${_appname//_/-}-bin"
_zhname="每日西语听力"
pkgver=9.7.0
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学西班牙语"
arch=('x86_64')
url="https://www.esdict.cn/ting"
license=('custom')
conflicts=(
    "${pkgname%-bin}"
    "eudic-${_appname//_/-}"
    "${_appname//_/-}"
)
depends=(
    'hicolor-icon-theme'
    'electron13'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('73e57df6718460a282ec4bd3d6aea59f78d6097b829b8516f8ab7075e81e981f'
            'bb199c3faf0e1155a5bc43512e1898e6604034a67d9e2f4d16840b3b359cc432'
            'f3c45d6d7cbc7c9ce6dd019ce75a62b82597f49174c54977f12a3f5764c4b881')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_zhname}/${_appname}\" %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
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