# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whatsapp-electron-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="WhatsApp Client built on Electron with multi-account support!"
arch=("x86_64")
url="https://github.com/dagmoller/whatsapp-electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('f95c0864886037968e2d0eecaca1f717822eacf55609a86d008a082234e1ca0d'
            'c6dd66edc7e43276a8b7b01474c3625d3bc30d531329591774e12f61c8be0461')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar.unpacked/assets/"* -t "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/assets"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}