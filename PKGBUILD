# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-gui-bin
pkgver=2.3.0
pkgrel=2
pkgdesc="Modern graphical user interface to peek into redis database (unofficial)"
arch=('x86_64')
url="https://github.com/ekvedaras/redis-gui"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19' 'glibc' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ekvedaras/redis-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a6867340661adc15b95b569c5bd0a82fb3dd61c9e76677d368f06367ce7d97ef'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5'
            'db40a9623a77a6788df4ad624d4d1b3ac28cb90ed74706d73fc2b70f251d2d48')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}