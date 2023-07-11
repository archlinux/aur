# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="distributionz-bin"
pkgver=1.1.4
pkgrel=2
pkgdesc="A simple tool to distribute Employees"
arch=('x86_64')
url="https://github.com/TheDome/DistributionZ"
license=('Apache')
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/DistributionZ-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('657fc8ffdd9ed3e828a09e5498a7e01468e4e6bea36f3cde7525b53d5ea483a9'
            '05d188815707feba39df1c4e444558c96d227b36478d7f3b700bab5d2f1d826d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}