# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xmachoviewer-bin
pkgver=0.04
pkgrel=10
pkgdesc="A Mach-O viewer.(Prebuilt version)"
arch=(x86_64)
url="https://horsicq.github.io/#xmachoviewer"
_ghurl="https://github.com/horsicq/XMachOViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/horsicq/XMachOViewer/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b39f9470d3b85e84b5123349a25e35ad414371c96d2980ac035780b6f69d2a8b'
            'd0dfc6996d90bc96474a32b5656eec06bf988cdbcfd226f24fcb7a062208e4ee'
            '814d5956d7c6b612b6e3b9492b255bb2c5f76f2f738333969eca9ed105a25eb6')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}