# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="krux-installer-bin"
pkgver=0.0.1alpha4
_pkgver=0.0.1-alpha-4
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices (WIP)"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${_pkgver}/KruxInstaller-${_pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/selfcustody/krux-installer/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('dfaede387473c3a7f494b79e963c409e365f3df59dc67ec003a65b37cb7884db'
            'b68fe242a948dedae52171bf19978e0926f357599b67f111f86fc2d23e20c9ff'
            '6fb09e00984f30e767f335d845b3c705d0ac89cabb2923f3b3d10021f13a03e4')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}