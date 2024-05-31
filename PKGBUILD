# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snapmail-bin
_pkgname=Snapmail
pkgver=0.3.1_rc.6
_electronversion=19
pkgrel=4
pkgdesc="An open-source P2P messaging app based on Holochain.It is the latest iteration of Snapmail from Glass Bead Software."
arch=('x86_64')
url="https://github.com/glassbeadsoftware/snapmail"
license=('CAL-1.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'gtk2'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
_install_path="/opt/appimages"
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver%_rc.6}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/glassbeadsoftware/snapmail/v${pkgver//_/-}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('e40525d3a19e352aaa261539ae9304a9eaf434ebcf4c427583062ecb12022fab'
            '12ce98b0343aa56cfff71264980dbbcb0f4696bff5500c3ea5f59aed05b9ef62'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}