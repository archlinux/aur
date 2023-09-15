# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ngrev-bin
pkgver=0.0.35
pkgrel=4
pkgdesc="Tool for reverse engineering of Angular applications"
arch=('x86_64')
url="https://github.com/mgechev/ngrev"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron11')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mgechev/ngrev/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('c9f1d0212edf967c97a2e29610712b4c5f14ca9e58a9c1fbb39be2bfbe3907b1'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4'
            '81658cf263ca15fa6bcd355e43ef2418f5331c5653ea2ee2b1af55b75fac5b3b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar pack "${srcdir}/squashfs-root/resources/app" "${srcdir}/app.asar"
    sed "s|AppRun %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    instal -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}