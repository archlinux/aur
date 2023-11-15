# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=liground-bin
pkgver=0.4.0
pkgrel=4
pkgdesc="A free, open-source and modern Chess Variant Analysis GUI for the 21st century"
arch=('x86_64')
url="https://ml-research.github.io/liground.github.io/"
_ghurl="https://github.com/ml-research/liground"
license=('AGPL3')
depends=(
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
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('7d0c4994cb489689183b3768952d9199971060dd873037a988c25f8d86cc1ad4'
            '6d4a0582113bbeeb99c1fd54948b437d152bdcfc4540e28db4fb5e2ea798cbb6')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/engines/"*stockfish -t "${pkgdir}/usr/lib/${pkgname%-bin}/engines"
    cp -r "${srcdir}/squashfs-root/static" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}