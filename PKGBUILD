# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snapmail-bin
_pkgname=Snapmail
pkgver=0.3.1
_subver=rc.6
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
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}-${_subver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/glassbeadsoftware/snapmail/v${pkgver}-${_subver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('e40525d3a19e352aaa261539ae9304a9eaf434ebcf4c427583062ecb12022fab'
            '12ce98b0343aa56cfff71264980dbbcb0f4696bff5500c3ea5f59aed05b9ef62'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}