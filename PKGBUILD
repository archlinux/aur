# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=painting-droid-bin
_pkgname='Painting Droid'
pkgver=0.2.25
pkgrel=1
pkgdesc="AI-powered cross-platform painting app inspired by the legendary MS Paint.(Prebuilt version)"
arch=('x86_64')
url="https://www.paintingdroid.com"
_ghurl="https://github.com/mateuszmigas/painting-droid"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('5f08358872d129205bb5ac2c198585c760d84698a04d20efedd28bd17c07a8b8')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Graphics;/g
        s/Exec=tauri-app/Exec=${pkgname%-bin}/g
        s/Icon=tauri-app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/tauri-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/tauri-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}