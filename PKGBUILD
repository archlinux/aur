# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tilde-podcast-bin
_pkgname=Tilde
pkgver=1.0.0
pkgrel=2
pkgdesc="Podcast client to listen to all you favorite podcasts"
arch=('x86_64')
url="https://github.com/paologiua/tilde"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron10')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/paologiua/tilde/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('36d92737e95db21231d580de2dd28b8d970f0872dec4f4f8e2e7143742f83702'
            'f1492bf906d1183083c07f5074b51ea36dc616136bf76d9f87e9a535a5345080'
            '1155b2c6deb4eef398d441ab43dbcbb09b97cc7b8fb2b1e2bb21cbd55e597e5e')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 600x600 800x800 1024x1024 1600x1600 3200x3200;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}