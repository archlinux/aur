# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sbe-bin
pkgver=3.4.0
pkgrel=2
pkgdesc="An unofficial Scrapbox desktop app"
arch=('x86_64')
url="https://github.com/kondoumh/sbe"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/kondoumh/sbe/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0e1c0f7a8b7db2919490432b7c01d94af54f22b3470389049b24e48a0e5bc0b9'
            '0c0557908ff74a92af66c9b4435403c14e230c11e56eace0016fcfb7151187d2'
            'fc83a8a0229a47ca00625e892e7b4bea7cc9090f89dba0a4efe189490cd046c3')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}