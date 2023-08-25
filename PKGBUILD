# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lisk-desktop-bin
pkgver=3.0.0_beta.2
pkgrel=1
pkgdesc="Lisk graphical user interface for desktop"
arch=('x86_64')
url="https://lisk.com/wallet"
_githuburl="https://github.com/LiskHQ/lisk-desktop"
license=('GPL3')
depends=('hicolor-icon-theme' 'bash' 'electron25')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-desktop-bin}-linux-${CARCH}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('516b81ce7e0476d7eff416fe7d42ab0de4bbc0f731c339bc48e093549e37ef63'
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