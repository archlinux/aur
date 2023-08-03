# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=feidao-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="飞稻在线课程设计平台"
arch=("x86_64")
url="https://www.fei-dao.com"
license=('custom')
depends=('bash' 'hicolor-icon-theme' 'electron13')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://oss.fei-dao.com/resources/application/linux/${pkgname%-bin}_latest.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('2a5f5919ebc8c7ef8ebd232758852c87dd0b165208dc46a501ce3cefdd23ded7'
            'f83092477277004c1afb55eb5ba7389cecfc7ede0f78b6f6d943621ebf1cd32d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}