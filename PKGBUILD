# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=warteschlangensimulator-appimage
_appname=Warteschlangensimulator
pkgver=5.8.0
pkgrel=1
pkgdesc="A free, platform independent, discrete-event, stochastic simulator which allows to model queueing systems in form of flowcharts."
arch=("x86_64")
url="https://a-herzog.github.io/Warteschlangensimulator/"
_ghurl="https://github.com/A-Herzog/Warteschlangensimulator"
license=('Apache-2.0')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_appname}-${CARCH}.AppImage"
)
sha256sums=('6e85294f3c4e1a8684db5fda6eb704872aaa2a4104a5e47e6bd76f638c924037')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Simulator.sh/${pkgname%-appimage} --no-sandbox/g" "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}
