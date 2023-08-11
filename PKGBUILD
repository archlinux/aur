# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=coinstac-desktop-app-bin
pkgver=6.7.5
pkgrel=2
pkgdesc="Collaborative Informatics and Neuroimaging Suite Toolkit for Anonymous Computation"
arch=('x86_64')
url="https://github.com/trendscenter/coinstac"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/COINSTAC-${pkgver}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trendscenter/coinstac/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('4926535efe3bac1411b2031b1239ced1680dc01442167fb2d48fcff679b3965f'
            'fcf8a012e25e06508e76c87a9607116d8cf2a195c8e12f960ff01e64b493f882'
            'bc492b5d011c155cba1b85cf460c8f9a064cb19bd3fd6e708f2323830eebfd4e')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
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