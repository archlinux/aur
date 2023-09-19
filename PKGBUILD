# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krux-installer-bin
_appname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.1_alpha_6
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices (WIP)"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('e51673df396aaf2d3035a848ce9b7b7365efa7a4ec34c408f5044430aa3ec073'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
            '071009f90463dc45d2030e791024a74cd5f7fe939f6f79dbfcbb21d56e314d7c')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}