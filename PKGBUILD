# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=utilso-bin
_pkgname=Utilso
pkgver=4.4.0
pkgrel=3
pkgdesc="Regex Tester, JWT Verify, Image Converter, Format JSON, Decode base64, Code Beautify and more.Work completely offline"
arch=("x86_64")
url="https://utilso.com"
license=("custom")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron13'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://cdn.utilso.com/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('3d26f15d7210f805f56d92f2d828844a0a16b789ec7e4f3a4983e50ae7d050cc'
            'f76129e6cdc1748270f37acfdd278015789a888d2226b81531bccd58486df1e5'
            'c8a1ebfa0cc2d078931548ef117b2cdc83746a8bc5c230f607e80ca61f0b2359')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}