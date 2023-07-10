# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="coinstac-desktop-app-bin"
pkgver=6.6.4
pkgrel=1
pkgdesc="Collaborative Informatics and Neuroimaging Suite Toolkit for Anonymous Computation"
arch=('x86_64')
url="https://github.com/trendscenter/coinstac"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/COINSTAC-${pkgver}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trendscenter/coinstac/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('125d78432afdcccdb41c00314b8cac549d6f5e1af2064d349fd77ad39c3917fa'
            'fcf8a012e25e06508e76c87a9607116d8cf2a195c8e12f960ff01e64b493f882'
            '45d0880dcfa82fdf69eac1a80c63765392a76d0a041abdf123b173a802bde8a9')
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