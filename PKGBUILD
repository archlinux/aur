# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fifo-browser-bin
_pkgname=Fifo
pkgver=1.3.1
_electronversion=20
pkgrel=7
pkgdesc="A modern web browser, built on top of modern web technologies such as Electron and React that is mean't to be secure."
arch=('x86_64')
url="https://fifo.snaildos.com/"
_ghurl="https://github.com/snaildos/Fifo-Browser"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'dbus-glib'
    'libdbusmenu-glib'
    'gtk2'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('68d59da728a07076d34dc05180d08d9e6b3740062590b996b6bd5c93a3072b18'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Browser;|Network;|g" -i "${srcdir}/squashfs-root/${pkgname%-browser-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-browser-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-browser-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}