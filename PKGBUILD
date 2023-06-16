# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="krux-installer-appimage"
pkgver=0.0.1alpha4
_pkgver=0.0.1-alpha-4
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices (WIP)"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_pkgver}/KruxInstaller-${_pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/selfcustody/krux-installer/main/LICENSE")
sha256sums=('dfaede387473c3a7f494b79e963c409e365f3df59dc67ec003a65b37cb7884db'
            'b68fe242a948dedae52171bf19978e0926f357599b67f111f86fc2d23e20c9ff')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}