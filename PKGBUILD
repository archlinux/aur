# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=prontus-bin
_pkgname=Prontus
pkgver=0.1.0
_subver=beta1
pkgrel=1
pkgdesc="An alternative client for Pronto.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/arihant2math/prontus"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/arihant2math/prontus/v${pkgver}-${_subver}/LICENSE"
)
sha256sums=('a6f097e9b178a81129ee4dd845ebc8fb0bc700f2814c133c99ca7aa94027cc21'
            'd9268a5317e5311e693fe02e83b45ffea6a9697f6b060784ba017fb5f38b886c')
prepare() {
    sed -i -e "
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
        s/Categories=/Categories=Network;/g
        s/Exec=ui/Exec=${pkgname%-bin}/g
        s/Icon=ui/Icon=${pkgname%-bin}/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/ui" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/ui.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}