# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weimail-bin
_uosname="cn.ankexinchuang.${pkgname%-bin}"
pkgver=2.3.6.7
pkgrel=1
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://ankexinchuang.cn/"
_downurl="https://ota.ankexinchuang.cn/new/client/uos/weimail/ankexinchuang.cn"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'nspr'
    'gtk2'
    'nss'
    'dbus-glib'
    'libxt'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/latest/${pkgname%-bin}-latest-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/latest/${pkgname%-bin}-latest-amd64.deb")
sha256sums=('9c37097fe7ef47cb66652053d95471239ec132a05d5e78664fe47b936878aa1d')
sha256sums_aarch64=('373a758528aa16d97166b5f87537ae9378055f8f615b5c0ac1462b568a5dd0c7')
sha256sums_x86_64=('73ebbc19b82425fcea39b08b157bb4ae951e2a2c629e7080cdf9fca0198bdd1c')
pkgver() {
    cd "${srcdir}/opt/apps/${_uosname}/entries/applications"
    grep "Version=" "${_uosname}.desktop" | sed "s/Version=//g"
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_uosname}\/files\///g
        s/\/opt\/apps\/${_uosname}\/files\/${_uosname}.png/${pkgname%-bin}/g
        s/Categories=Email;/Categories=Network;/g
    " "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_uosname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    _icon_sizes=(16 24 32 48 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/apps/${_uosname}/files/chrome/icons/default/default${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
}