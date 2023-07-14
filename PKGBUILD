# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=gridea-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A static blog writing client"
arch=('x86_64')
url='https://gridea.dev'
_githuburl="https://github.com/getgridea/gridea"
license=('MIT')
provides=("${pkgname%-bin}")
depends=('electron7' 'bash')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Gridea-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/getgridea/gridea/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9538866b640e44e9fd54bc1b3a957d1625648f1c1dd6b942dcd73d22701ede4e'
            'd5fd1669066ffaab84a9063cd2792ded7aca1f6f92a972f58ffb5173404b53d2'
            '92a2f6e882f85218006619245a814ba8ddc58dbe0121fa9c57d3855acfb4fdc7')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/squashfs-root/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}