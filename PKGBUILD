# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fukayo-bin
_appname=Fukayo
pkgver=0.13.0
pkgrel=3
pkgdesc="A desktop application to read your favorite manga/manhwa/manhua from your favorite websites."
arch=('x86_64')
url="https://github.com/JiPaix/Fukayo"
license=("MIT")
depends=('electron24' 'bash')
makedepends=('asar')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/JiPaix/fukayo/beta/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f982a5dc87485a30ac82f8c77dd400733ee192aa8d34f28fb59f06b7205a7861'
            'c3fb2affb5fa8ed0b1866d379461e7e0c845ac7011f67aa7410cfe080f8d753a'
            'e93979ffeb57e6ac91eca7fcb55c9473932168a8e2d22ccef23cdef359479786')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/squashfs-root/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}