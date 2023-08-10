# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=webkitty-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Local web development IDE"
arch=("x86_64")
url="https://dartfling.com/product?pid=3"
_githuburl="https://github.com/yikuansun/webkitty"
license=("MIT")
depends=('bash' 'electron24')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WebKitty-${pkgver}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/yikuansun/webkitty/master/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('79ddd279094e41f6ef7f6b051d590cb056253f06053997132bbf3fdaf38bc890'
            'c46ac74ef8cd13c7541f9de280f3d759319f70292fd32d4d170193041b06300b'
            '62c2a438ded414143a25d2de02c6e9b8363935b6777ce996f8410f6dc8eee1a5')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}e|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}