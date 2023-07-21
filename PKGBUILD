# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=utilso-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Regex Tester, JWT Verify, Image Converter, Format JSON, Decode base64, Code Beautify and more.Work completely offline"
arch=("x86_64")
url="https://utilso.com"
license=("custom")
depends=('bash' 'electron13' 'gcc-libs')
conflit=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://cdn.utilso.com/Utilso-${pkgver}.AppImage"
        "LICENSE.html::${url}/terms"
        "${pkgname%-bin}.sh")
sha256sums=('3d26f15d7210f805f56d92f2d828844a0a16b789ec7e4f3a4983e50ae7d050cc'
            'fc63efa82c1568d389b35d9b096405d68b49870acaa91f74521021fa433b72e3'
            'd72369928845ed5dd766551e50fc899ea346b3547907f53962cb7c5d43793599')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}