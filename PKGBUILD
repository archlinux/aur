# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=colorpicker-app-bin
_pkgname=Colorpicker
pkgver=2.2.0
pkgrel=3
pkgdesc="A mininal but complete colorpicker desktop app"
arch=('x86_64')
url="https://colorpicker.fr/"
_githuburl="https://github.com/Toinane/colorpicker"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-app-bin}" "${pkgname%-app-bin}-fr")
depends=('bash' 'electron19' 'glibc' 'libxtst' 'libx11')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('791495d718a2245294bda7ed431353a8b3f24d8f6b586fed104783aa85fe58a2'
            '13c994f2ce85dff55b214f8f1b5d1411fc00702eae394f2e558189c963d11385')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}