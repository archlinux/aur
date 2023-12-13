# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snapmail-appimage
_pkgname=Snapmail
pkgver=0.3.1_rc.6
pkgrel=2
pkgdesc="An open-source P2P messaging app based on Holochain.It is the latest iteration of Snapmail from Glass Bead Software."
arch=('x86_64')
url="https://github.com/glassbeadsoftware/snapmail"
license=('CAL-1.0')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver%_rc.6}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/glassbeadsoftware/snapmail/v${pkgver//_/-}/LICENSE.md"
)
sha256sums=('e40525d3a19e352aaa261539ae9304a9eaf434ebcf4c427583062ecb12022fab'
            '12ce98b0343aa56cfff71264980dbbcb0f4696bff5500c3ea5f59aed05b9ef62')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}