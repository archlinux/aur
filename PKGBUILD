# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fairshare-bin
_appname=FAIRshare
pkgver=2.1.0
_electronversion=25
pkgrel=6
pkgdesc="Simplifying the curation and sharing of biomedical research data and software according to applicable FAIR guidelines"
arch=('x86_64')
url="https://fairdataihub.org/fairshare"
_ghurl="https://github.com/fairdataihub/FAIRshare"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fairdataihub/FAIRshare/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9c6bf87ec638dcb3dc44de81e268a57453f26c4e345023a3664ed0f744c2a7c3'
            'f53ab2779598ebdd8bef9425c402eed3cac0e2a6dc3ec5cbda5a07de0bdcf7dc'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/api" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}