# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-appimage
_appname="Beam-Wallet"
_pkgver=7.5
_subver=13831.5762
pkgver="${_pkgver}.${_subver}"
pkgrel=1
pkgdesc="Beam Desktop Wallet"
arch=('x86_64')
url="https://beam.mw/"
_ghurl="https://github.com/BeamMW/beam-ui"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.zip::${_ghurl}/releases/download/beam-${pkgver}/Linux-${_appname}-${pkgver}.zip"
)
sha256sums=('6dba2f36c53d9f3172ff0ccf89c9d482a059dd423423969d1adbf41b37211be9')
build() {
    chmod a+x "${srcdir}/${_appname}-${pkgver}.AppImage"
    "${srcdir}/${_appname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|/usr/bin/${_appname//-/}|${pkgname%-appimage}|g;s|Icon=${pkgname%-wallet-appimage}|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_appname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_appname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}