# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fukayo-bin
_appname=Fukayo
pkgver=0.13.0
pkgrel=4
pkgdesc="A desktop application to read your favorite manga/manhwa/manhua from your favorite websites."
arch=('x86_64')
url="https://github.com/JiPaix/Fukayo"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron24' 
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
    'java-runtime'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/JiPaix/fukayo/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f982a5dc87485a30ac82f8c77dd400733ee192aa8d34f28fb59f06b7205a7861'
            'c3fb2affb5fa8ed0b1866d379461e7e0c845ac7011f67aa7410cfe080f8d753a'
            'a32492ad76f370a025b09bef6d2e40de877455e5c8e8c67f79849b34cbc581cf')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}