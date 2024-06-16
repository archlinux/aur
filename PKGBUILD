# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: J. C. Hammons <jch at bitma dot st>
# Contributor: Amr Okasha <amradel55 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=netron-bin
_pkgname=Netron
pkgver=7.7.3
_electronversion=31
pkgrel=1
pkgdesc="Visualizer for neural network, deep learning and machine learning models"
arch=('x86_64')
url="https://netron.app/"
_ghurl="https://github.com/lutzroeder/netron"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lutzroeder/netron/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c4525666b7e5fe59c66bf9d8048483cc462ff30eb268a624ddf8f3e4012f63b7'
            '535cb2c7c8990f967c106e3035e4df8d3e070144af1163b86c8bb58b65fe5e88'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}