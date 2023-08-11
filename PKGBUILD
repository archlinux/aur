# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=casterr-bin
pkgver=1.4.0
pkgrel=3
pkgdesc="Screen recorder with the main goal of easing the process of recording and clipping your best moments in-game."
arch=('x86_64')
url="https://casterr.sbond.co/"
_githuburl="https://github.com/sbondCo/Casterr"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron22' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Casterr-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('00dc61292ca49a7a7c88f9f20d8effacc34d9e4fb547fa1c7a717a13fbec8138'
            '43ef80edc5f51084cd4c6c5029991d83853d7376e9c7daf9d7f4795e6006760b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}