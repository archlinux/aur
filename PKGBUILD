# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kdesktop-bin
_pkgname="cn.kdocs.${pkgname%-bin}"
pkgver=3.7.7
_electronversion=13
pkgrel=6
pkgdesc="金山文档"
arch=('x86_64')
url="https://www.kdocs.cn"
_downurl="https://d.store.deepinos.org.cn/store"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/office/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('57e6e623bbb761d5b2e3a8dd5c179189e585b40e14cc9f9f17213797093e88ef'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    gendesk -q -f -n --categories "Office" --name "${pkgname%-bin}" --exec "${pkgname%-bin} %U"
    sed "5i Name[zh_CN]=${pkgdesc}" -i "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}