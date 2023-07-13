# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fifo-browser-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="A modern web browser, built on top of modern web technologies such as Electron and React that is mean't to be secure."
arch=('x86_64')
url="https://fifo.snaildos.com/"
_githuburl="https://github.com/snaildos/Fifo-Browser"
license=('GPL3')
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('electron20' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fifo-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('68d59da728a07076d34dc05180d08d9e6b3740062590b996b6bd5c93a3072b18'
            'ec09a498b940937b0ace0c5fda5b3ee049e8c86ef8525175f2fc2cdfe337e687')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-browser-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Browser;|Network;|g" -i "${srcdir}/squashfs-root/${pkgname%-browser-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-browser-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}