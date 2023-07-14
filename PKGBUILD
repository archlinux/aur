# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="intrigue-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc="Organize literature into ideas, fast."
arch=('x86_64')
url="https://github.com/shaunabanana/intrigue"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron12' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Intrigue-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('467fdc85ce640e9289604e7e7ce60e0b9146b295da857b100603749f988e38d0'
            '0f2c5dcc0569e9d7891ba75ed27f119b080b0fd27e82bcfda328c3051f37f87c')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}.AppImage"
    "./${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 16x16 32x32 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}