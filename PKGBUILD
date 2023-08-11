# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=f1mv-lights-integration-bin
_appname=F1MV-Lights-Integration
pkgver=2.2.1
pkgrel=3
pkgdesc="The best way to connect your smart home lights to MultiViewer."
arch=('x86_64')
url="https://f1mvli.jstt.me/"
_githuburl="https://github.com/JustJoostNL/F1MV-Lights-Integration"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('411e7360e404029e27612637f056b466355b643ab536f76291499e1f8a412be6'
            '5397d86f3e2b712861651659297a459e7c8a508b2f19abab1658713754bd4a13')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}