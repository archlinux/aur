# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flux-editor-bin
_pkgname='Flux Editor'
pkgver=0.8.0
pkgrel=1
pkgdesc="A minimalist and lightweight code editor made with Tauri.(Prebuilt version)"
arch=('x86_64')
url="https://fluxeditor.github.io/"
_ghurl="https://github.com/kyteidev/Flux-Editor"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('0ecc15b8619f55c2b09674614b9548954d51056d291d41e0518406fedf05ba6b')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Development;/g
        s/Exec=\"${_pkgname}\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/_up_/resources/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
