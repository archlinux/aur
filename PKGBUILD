# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=air_controller
pkgname="${_pkgname//_/-}-desktop-bin"
_appname=AirController
pkgver=0.4.0
pkgrel=2
pkgdesc="A new handy and powerful Android phone assistant,powered by Flutter."
arch=('x86_64')
url="http://ac.yhdm360.cn/"
_ghurl="https://github.com/air-controller/air-controller-desktop"
license=('MIT')
provides=("${_pkgname//_/-}=${pkgver}")
conflits=(
    "${_pkgname//_/-}"
    "${pkgname%-bin}"
)
depends=(
    'gtk3'
    'gst-plugins-base-libs'
    'gstreamer'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_appname}_${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/air-controller/air-controller-desktop/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9c81fa659acffa74b7576e5dfbc62486d8131157b9d4bfc2a34bdc567bc080c8'
            '72bf32e1daa153b870aff8200c06521b4d15d7aedba46d4c37570c49cacc1ace'
            '1e338ff128b2be2b0d484ea2d00814db6709a5e2cc455a373428d21f8ed690d5')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_pkgname}_desktop|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/${_pkgname}_desktop" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}