# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=warteschlangensimulator-appimage
_appname=Warteschlangensimulator
pkgver=6.0.0
pkgrel=1
pkgdesc="A free, platform independent, discrete-event, stochastic simulator which allows to model queueing systems in form of flowcharts."
arch=("x86_64")
url="https://a-herzog.github.io/Warteschlangensimulator/"
_ghurl="https://github.com/A-Herzog/Warteschlangensimulator"
license=('Apache-2.0')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_appname}-${CARCH}.AppImage"
)
sha256sums=('ed9e5f658cd1ad32c3b142019b4f35e5efac41ea88c825e52fce81c0bd4b237f')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Simulator.sh/${pkgname%-appimage} --no-sandbox/g" "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}
