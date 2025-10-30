# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rclone-ui-bin
_pkgname='Rclone UI'
pkgver=2.7.16
pkgrel=1
pkgdesc="The cross-platform desktop GUI for rclone & S3.(Prebuilt version)"
arch=(
    #'aarch64'
    'x86_64'
)
url="https://rcloneui.com/"
_ghurl="https://github.com/rclone-ui/rclone-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'rclone'
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_x86_64.rpm")
sha256sums_x86_64=('349c4732726b10c06daeb2aa34ef577b12260fb7153e525915e05981c69fedde')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Exec=\"${_pkgname}\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/icons/favicon/"*.png -t "${pkgdir}/usr/lib/${_pkgname}/icons/favicon"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
