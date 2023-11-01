# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lisk-desktop-bin
pkgver=3.0.0_rc.3
pkgrel=1
pkgdesc="Lisk graphical user interface for desktop"
arch=('x86_64')
url="https://lisk.com/wallet"
_githuburl="https://github.com/LiskHQ/lisk-desktop"
license=('GPL3')
depends=(
    'bash'
    'electron25'
    'hicolor-icon-theme'
)
makedepends=('squashfuse')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-desktop-bin}-linux-${CARCH}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('5a2884d571053644e02d4885a0fb0d7292c45c35ac30b8c2ec22b2facd73e6cd'
            '6a041b508c401d7776dc512430f9a0802aa2c5d1c07cb6ab4b59ed65857b9b5e')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}