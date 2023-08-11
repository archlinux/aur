# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=data-works-bin
_appname=DataWorks
pkgver=1.0.0
pkgrel=3
pkgdesc="A simple data management system intended to be flexible and expandable"
arch=('x86_64')
url="https://github.com/alexaib2002/project-dataworks_base"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron21' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('90ca960db8eedcf706a490998f12111885a17d408b5016fe40d5628fe85697b0'
            '6fcab97aaeca7888f1e63f08561328912e00f92971a254f870f2aeeb18b9d3d2')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}