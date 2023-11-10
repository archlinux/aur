# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=air_controller
pkgname="${_pkgname//_/-}-desktop-appimage"
_appname=AirController
pkgver=0.4.0
pkgrel=6
pkgdesc="A new handy and powerful Android phone assistant,powered by Flutter."
arch=('x86_64')
url="http://ac.yhdm360.cn/"
_githuburl="https://github.com/air-controller/air-controller-desktop"
license=('MIT')
provides=("${_pkgname//_/-}=${pkgver}")
conflits=("${_pkgname//_/-}" "${pkgname%-appimage}")
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${_pkgname//_/-}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_appname}_${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/air-controller/air-controller-desktop/${pkgver}/LICENSE"
)
sha256sums=('9c81fa659acffa74b7576e5dfbc62486d8131157b9d4bfc2a34bdc567bc080c8'
            '72bf32e1daa153b870aff8200c06521b4d15d7aedba46d4c37570c49cacc1ace')
build() {
    chmod a+x "${srcdir}/${_pkgname//_/-}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname//_/-}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_pkgname}_desktop|${_pkgname//_/-}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname//_/-}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname//_/-}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${_pkgname//_/-}.AppImage" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname//_/-}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname//_/-}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}