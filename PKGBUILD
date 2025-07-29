# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qaxbrowser
_pkgname="${_appname}-safe-stable"
pkgname=qianxin-browser-stable
pkgver=1.0.45966.7_1
pkgrel=1
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.qianxin.com/product/detail/pid/333"
_dlurl="https://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88"
license=('LicenseRef-custom')
conflicts=("${pkgname%-stable}" "${_pkgname%-stable}" "${_pkgname%-safe-stable}")
depends=(
    'alsa-lib'
    'gtk2'
    'nss'
    'nspr'
    'libdrm'
    'libxkbcommon'
    'mesa'
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dlurl}/[qsigned]${_pkgname}_${pkgver//_/-}_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dlurl}/[qsigned]${_pkgname}_${pkgver//_/-}_amd64.deb")
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('368c8e1aff7ff8d7b5843e12222e58c6e43fee8aa8d65581b33d65ec48586a43'
            '356a40c5edf98b24ab14c456f09ffe0e5e43f3110f344db52951dae52dbce592')
sha256sums_aarch64=('16ad24aa93931d238eb6e6a5f5c2d141d9d5c6be63ee8bea2dc886cb194dcf9f')
sha256sums_x86_64=('e8c23e014a3146f55c38b0617481fc1e4705864d2195ff377faaf1b8f0485569')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/usr\/bin\/${_pkgname}/Exec=${pkgname}/g
        s/Icon=${_pkgname%-stable}/Icon=${pkgname}/g
    " "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop"
    sed -i "s/\/opt\/qianxin.com\/${_appname}\/${_pkgname%-stable}/${pkgname}/g" "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml"
    sed -i -e "
        s/\/opt\/qianxin.com\/${_appname}\/product_logo_32.xpm/${pkgname}.xpm/g
        s/\/opt\/qianxin.com\/${_appname}\/${_appname}-safe/${pkgname}/g
    " "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu"
    sed -i "s/chromium-browser/${pkgname}/g" "${srcdir}/usr/share/appdata/${_pkgname%-stable}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/qianxin.com/${_appname}/"* "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_pkgname%-stable}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml" \
        "${pkgdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml"
    install -Dm644 "${srcdir}/usr/share/man/man1/"* -t "${pkgdir}/usr/share/man/man1"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/qianxin.com/${_appname}/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu" "${pkgdir}/usr/share/menu/${pkgname}.menu"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
