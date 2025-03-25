# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scramblery-bin
_pkgname=Scramblery
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop app for image and video scrambling with various methods including Fourier phase scramble: Entire image/video or just detected facial area.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/altunenes/scramblery"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-0.1.0-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/altunenes/scramblery/v${pkgver}/LICENSE"
)
sha256sums=('931db29da61bfa88d093051d762e7590df72b94fd2fbce5c46cd4b0f5090e5ce'
            '68397f88fb901932ec90e365b3cb3d6b54af35fba8e3d23e5f7eaab8c6d296ed')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        /Comment=/d
        4i\Comment=${pkgdesc}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/models/version-RFB-640.onnx" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources/models"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}