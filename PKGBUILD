# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-redis-ui-bin"
pkgver=2023.4.104
pkgrel=1
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=('x86_64')
url="https://www.corifeus.com/redis-ui"
_githuburl="https://github.com/patrikx3/redis-ui"
license=("MIT")
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/P3X-Redis-UI-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/patrikx3/redis-ui/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('787b277b2973597afcd167e254359b231623adead62d52da837e555656702c77'
            'fa55caa8dd41b754664e637a0229778c221e6dca55857739f82cae78403ec994'
            '543c84f92507339466afa0aace275621589f794ca68d6f746e27f6d874e0fbba')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}