# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lisk-desktop-bin
pkgver=3.0.0_rc.0
pkgrel=1
pkgdesc="Lisk graphical user interface for desktop"
arch=('x86_64')
url="https://lisk.com/wallet"
_githuburl="https://github.com/LiskHQ/lisk-desktop"
license=('GPL3')
depends=('bash' 'electron25' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-desktop-bin}-linux-${CARCH}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('5cd6ba688d1741d933d80086ac4d4462333ef231f560b9c99ecf7481317139ef'
            'd5ddd8f778b190ee1c005825a3d5974c5bde35426ebef149950a9ed75036d3b1')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}