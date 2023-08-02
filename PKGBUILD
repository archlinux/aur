# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-appimage
_appname="Beam-Wallet"
pkgver=7.3.14027.5732
pkgrel=2
pkgdesc="Beam Desktop Wallet"
arch=('x86_64')
url="https://beam.mw/"
_githuburl="https://github.com/BeamMW/beam-ui"
license=('Apache')
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.zip::${_githuburl}/releases/download/beam-${pkgver}/${_appname}-${pkgver}.zip")
sha256sums=('ec1fac7fba8ce6e6597d01515a252f84823b6b1c06252550d04186b59d499c9a')
prepare() {
    chmod a+x "${srcdir}/${_appname}-${pkgver}.AppImage"
    "${srcdir}/${_appname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${_appname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    sed "s|/usr/bin/BeamWallet|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Icon=${pkgname%-wallet-appimage}|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/BeamWallet.desktop"
    install -Dm644 "${srcdir}/squashfs-root/BeamWallet.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}