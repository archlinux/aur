# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brs-desktop-bin
_pkgname='BrightScript Simulator'
pkgver=1.4.0
_electronversion=25
pkgrel=1
pkgdesc="Roku device simulator as a desktop app "
arch=(
    'armv7h'
    'x86_64'
)
url="https://github.com/lvcabral/brs-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lvcabral/brs-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('2a22abb3fe5e373c8bc269cc5f61321ca9ece31084b86e3b093bd7bf37427c23'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_armv7h=('83967f916596aadcc34cca5535e6f9730ec7af357cbf0189053ec69717d18e6b')
sha256sums_x86_64=('d674e182ab35eccebc17ea221820abef165e744c26caf3642c2ec89040ce8fe5')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname} (development)/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/icon.ico/icon.png/g" "${srcdir}/app.asar.unpacked/app/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}