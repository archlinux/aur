# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weimail-bin
_uosname="cn.ankexinchuang.${pkgname%-bin}"
pkgver=2.3.6.5
pkgrel=2
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China."
arch=(
    'aarch64'
    'x86_64'
)
url="https://ankexinchuang.cn/"
_downurl="https://ota.ankexinchuang.cn/new/client/uos/weimail/ankexinchuang.cn"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'java-runtime'
    'gtk3'
    'nspr'
    'gtk2'
    'nss'
    'hicolor-icon-theme'
    'dbus-glib'
    'libxt'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/latest/${pkgname%-bin}-latest-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/latest/${pkgname%-bin}-latest-amd64.deb")
sha256sums=('477e6aae1d92f07f2ee0cf64abdfec881f0bb5b39f28f2d1d18492c21bef8e30')
sha256sums_aarch64=('0ebd90d2c166b3f1679383b4ee10a9cda1755171279b6e9b5fabd3730cfca02e')
sha256sums_x86_64=('ca223885989a6bb568448a0dd5d204c26d33751c25f42c249be57ddc023825b6')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/apps/${_uosname}/files/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|.png||g" \
        -e "s|Categories=Email;|Categories=Network;|g" \
        -i "${srcdir}/opt/apps/${_uosname}/entries/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_uosname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    for _icons in 16 24 32 48 256;do
        install -Dm644 "${srcdir}/opt/apps/${_uosname}/files/chrome/icons/default/default${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
}