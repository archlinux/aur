# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qaxbrowser
_pkgname="${_appname}-safe-stable"
pkgname=qianxin-browser-stable
pkgver=1.0.45554.7
pkgrel=1
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.qianxin.com/product/detail/pid/333"
_downloadurl="https://dl.qianxin.com/c8a52014-99d3-57ff/45554"
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
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_amd64.deb")
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('368c8e1aff7ff8d7b5843e12222e58c6e43fee8aa8d65581b33d65ec48586a43'
            '6ffb95b6435970c0b1bfab1efd8979e5613a5ce2d10c4f2570dffd594e5b6ba6')
sha256sums_aarch64=('11e817105094b4c589a0995e5cce33a6598f6b593bff6e3ceb7c0f27667d1c59')
sha256sums_x86_64=('4724f522b0d7b99b4ce75aa0e0ffb5066410501f15d0a7e0093ea9f1d41dfb1a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|Exec=/usr/bin/${_pkgname}|Exec=${pkgname}|g;s|Icon=${_pkgname%-stable}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop"
    sed "s|/opt/qianxin.com/${_appname}/${_pkgname%-stable}|${pkgname}|g" \
        -i "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml"
    sed -e "s|opt/qianxin.com/${_appname}/product_logo_32.xpm|opt/${pkgname}/product_logo_32.xpm|g" \
        -e "s|/opt/qianxin.com/${_appname}/${_appname}-safe|${pkgname}|g" \
        -i "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/opt/qianxin.com/${_appname}/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_pkgname%-stable}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname%-stable}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname%-stable}.xml" \
        "${pkgdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml"
    install -Dm644 "${srcdir}/usr/share/man/man1/"* -t "${pkgdir}/usr/share/man/man1"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/opt/qianxin.com/${_appname}/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname%-stable}.menu" "${pkgdir}/usr/share/menu/${pkgname}.menu"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}