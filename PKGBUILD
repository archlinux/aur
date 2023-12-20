# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechesscontrol-bin
_pkgname=ChineseChessControl
_appname="org.Rabbit.${_pkgname%Control}"
pkgver=2.0.11
pkgrel=4
pkgdesc="中国象棋控件,包括中国象棋 MFC 扩展库，中国象棋 activex 控件,中国象棋Qt插件,人工智能引擎等"
arch=("x86_64")
url="https://github.com/KangLin/ChineseChessControl"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'qt5-multimedia'
    'qt5-base'
    'qt5-webengine'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_Linux_${CARCH}_setup.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('af81a3bc853c3d5a26ba1ef6b23a25f0c65ce7fca5affe66ee8619b66c796bf6'
            'cbd162f25a20f7137901901ebee7d90cb7d587ca46e10f5f23a9302adb85bee0')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|ChineseChessApp-v${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/opt/${_pkgname}/bin/ChineseChess.sh|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}