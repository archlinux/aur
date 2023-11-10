# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=astrofox-bin
_pkgname=Astrofox
pkgver=1.4.0
pkgrel=4
pkgdesc="A motion graphics program that lets you turn audio into amazing videos."
arch=('x86_64')
url="https://astrofox.io"
_githuburl="https://github.com/astrofox-io/astrofox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron16'
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
    "${pkgname%-bin}-${pkgver}.AppImage::https://files.astrofox.io/download/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/astrofox-io/astrofox/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('05327ea2944741d8bab8ef5f8bfd33530fbbb72ad85b6e4c411714c6fd295b65'
            '2366e943e400fbf8d55651d8f29257f7a680ce6fcb428d0215e75362f8728e43'
            '327c73926cfcde62e792694baee771f3387bece1221f97b04297de23f687e6a8')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755  "${srcdir}/squashfs-root/resources/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}