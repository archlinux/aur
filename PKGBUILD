# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sixgrid-bin
_pkgname=SixGrid
pkgver=0.3.7_2
pkgrel=1
pkgdesc="Open-Source Desktop Client for e926/e621 and websites alike"
arch=("x86_64")
url="https://github.com/SixGrid/sixgrid"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron11'
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-59eec7f0cda0db6230b5292a6f0329f52dd53271-linux-amd64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('08c237d8d71ec516c90bb8a8f197da51acb7489966f373c7021b2cecff3ee850'
            '4fdde00f2ea328b7a16911addc2e1e29cb8bc41506edc917fb486054bd1b1325')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}