# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=danmoshui
pkgname="deepin-wine-${_pkgname}"
_sparkname="com.${_pkgname}.spark"
_zhsname="淡墨水字帖"
pkgver=0.0.6
pkgrel=6
pkgdesc="DanMoShui Calligraphy on deepin wine 6.基于Deepin Wine 6的淡墨水字帖PC版。"
arch=("x86_64")
url="https://danmoshui.com"
_downurl="https://d.store.deepinos.org.cn/store"
license=('LicenseRef-custom')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::${_downurl}/office/${_sparkname}/${_sparkname}_${pkgver}spark0_amd64.deb"
    "LICENSE-${pkgver}::${url}/privacy_policy"
    "${pkgname}.sh"
)
sha256sums=('8e2e1d90abf308a5f7eb105db2abb684d4b39955ce4fe3c4b09b2722eeb37f0f'
            'bd406f5d41584e0234c580d53462045843b5670467568d1478042499f864dc87'
            '1e22a11ea9be78f91a43e9be7e572dca1e88dcd59601eb734156f788d76d4e0f')
build() {
    sed -e "s|@bottlename@|${_pkgname}|g" \
        -e "s|@pkgver@|${pkgver}|g" \
        -e "s|@runname@|${_zhsname}|g" \
        -e "s|@pkgname@|${pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g;s|${_sparkname}|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}