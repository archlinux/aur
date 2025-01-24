# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=blink
pkgname="${_appname}-player-bin"
_pkgname=Blink
pkgver=1.0.0_alpha03
pkgrel=1
pkgdesc="Modern Desktop Jellyfin Client made with Tauri and React ⚛️.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/prayag17/Blink"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_1.0.0-alpha.3_amd64.deb")
sha256sums=('5a94e766a02776c0fd991d9148deb3abc148f3dfeec9aec4bd88265cd6e0581b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
        s/Exec=${_appname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}