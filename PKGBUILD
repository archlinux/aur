# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=gridea-bin
_pkgname=Gridea
pkgver=0.9.3
pkgrel=5
pkgdesc="A static blog writing client.静态博客写作客户端"
arch=('x86_64')
url='https://gridea.dev'
_githuburl="https://github.com/getgridea/gridea"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron7'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'

)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/getgridea/gridea/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9538866b640e44e9fd54bc1b3a957d1625648f1c1dd6b942dcd73d22701ede4e'
            'd5fd1669066ffaab84a9063cd2792ded7aca1f6f92a972f58ffb5173404b53d2'
            '8d425e6d058d105def17629df226b070b5d54b7d085e9f5a13b7adf683fae7b2')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar pack "${srcdir}/squashfs-root/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}