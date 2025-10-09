# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rclone-ui-bin
_pkgname='Rclone UI'
pkgver=2.7.2
pkgrel=1
pkgdesc="The cross-platform desktop GUI for rclone & S3.(Prebuilt version)"
arch=(
    'aarch64'
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_x86_64.rpm")
sha256sums_aarch64=('14155c11e478c0a8ecb20bea6df9313d3eb3b386b425db43dd3326c68887509e')
sha256sums_x86_64=('1f156733e389d79787fd5c8cbee900b7c7b6829e395768eaa0349a4bba1f5723')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Exec=app/Exec=${pkgname%-bin}/g
        s/Icon=app/Icon=${pkgname%-bin}/g
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
