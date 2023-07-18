# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-gui-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Modern graphical user interface to peek into redis database (unofficial)"
arch=('x86_64')
url="https://github.com/ekvedaras/redis-gui"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=('bash' 'electron19' 'glibc' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ekvedaras/redis-gui/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a6867340661adc15b95b569c5bd0a82fb3dd61c9e76677d368f06367ce7d97ef'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5'
            'db40a9623a77a6788df4ad624d4d1b3ac28cb90ed74706d73fc2b70f251d2d48')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}.AppImage"
    "./${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}