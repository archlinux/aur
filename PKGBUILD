# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=winggifeditor-bin
_pkgname=WingGifEditor
_appname="com.wingsummer.${pkgname%-bin}"
pkgver=1.1.2
pkgrel=7
pkgdesc="基于 QT 编写的 GIF 编辑器，采用 C++ 进行开发"
arch=('x86_64')
url="https://github.com/Wing-summer/WingGifEditor"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'qt5-x11extras'
    'libglvnd'
    'dtkcore'
    'dtkgui'
    'dtkwidget'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_appname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c2e56a4478a7540afa7d52819d37e9d6b30d7afb577002dd3825b928d83125b2'
            '6e4ce8626e9821a55a253bb68db316536b43cc2b4ed0d154d1495a928fb2603f')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt/${_pkgname}/${_pkgname}\"|${pkgname%-bin}|g" \
        -e "s|/opt/${_pkgname}/images/icon.png|${pkgname%-bin}|g" \
        -e "s|WingHexExplorer|${_pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"    
    install -Dm644 "${srcdir}/opt/${_pkgname}/lang/default.qm" -t "${pkgdir}/opt/${pkgname%-bin}/lang"
    install -Dm644 "${srcdir}/opt/${_pkgname}/images/icon.png" -t "${pkgdir}/opt/${pkgname%-bin}/images"
    install -Dm644 "${srcdir}/opt/${_pkgname}/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}