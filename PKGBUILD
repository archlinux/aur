# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bitclient-bin
_pkgname=Bitclient
pkgver=1.0.0_beta5
_electronversion=31
pkgrel=1
pkgdesc="🛡️ Bitclient is an alternative desktop client application designed for the Bitwarden® platform.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/sgolub/bitclient"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/sgolub/bitclient/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('606866a7aa340ee0ee3fd099371151c559682bdae159f1f3ea087f12ef7f4925'
            'd535ceb55e3959987d79d75a6e3cfb38da6cbdee524968a247554bf998d3bd72'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=\${productName}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/squashfs-root/\${productName}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/\${productName}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/\${productName}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}