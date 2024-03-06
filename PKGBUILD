# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kdesktop-bin
_pkgname="cn.kdocs.${pkgname%-bin}"
pkgver=3.7.7
_electronversion=14
pkgrel=7
pkgdesc="金山文档"
arch=('x86_64')
url="https://www.kdocs.cn"
_downurl="https://d.store.deepinos.org.cn/store"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/office/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('57e6e623bbb761d5b2e3a8dd5c179189e585b40e14cc9f9f17213797093e88ef'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/apps/${_pkgname}/files/bin/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/opt/apps/${_pkgname}/entries/icons/hicolor/256x256/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}