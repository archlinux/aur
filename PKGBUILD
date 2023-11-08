# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tomatox-bin
_pkgname=TOMATOX
pkgver=2.0.2
pkgrel=3
pkgdesc="基于Electron、React开发的全网在线免费VIP视频解析播放器,美剧、韩剧、日剧全资源"
arch=('x86_64')
url="https://github.com/yanjiaxuan/TOMATOX"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron4'
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/yanjiaxuan/TOMATOX/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('294ae9a684fe1d8930d852b185dc2d6a6bbc529d5cab14c774228fa881b6e303'
            '457f427d3d4e78f789b6951120b438fd08cbed02372b078cb2346677f5e27029'
            '39ded07fe594d35bcde996c039e527dff491ce32a82a47dd4beba66500354069')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g;s|Development|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}