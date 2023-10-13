# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lisk-desktop-bin
pkgver=3.0.0_rc.2
pkgrel=1
pkgdesc="Lisk graphical user interface for desktop"
arch=('x86_64')
url="https://lisk.com/wallet"
_githuburl="https://github.com/LiskHQ/lisk-desktop"
license=('GPL3')
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('squashfuse')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-desktop-bin}-linux-${CARCH}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('d7cc6389223ad7fe741d5ef05e6da9f059a864de70984eb0247d5e8c609e972a'
            'b736079ac7eb8aa08222992dc556fba29ab8a81ad1205deff51e47e25885f3f9')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}