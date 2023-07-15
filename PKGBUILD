# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lisk-desktop-bin"
pkgver=3.0.0beta.0
_pkgver=3.0.0-beta.0
pkgrel=1
pkgdesc="Lisk graphical user interface for desktop"
arch=('x86_64')
url="https://lisk.com/wallet"
_githuburl="https://github.com/LiskHQ/lisk-desktop"
license=('GPL3')
depends=('hicolor-icon-theme' 'bash' 'electron25')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${_pkgver}/${pkgname%-desktop-bin}-linux-${CARCH}-${_pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('47cb8e332bc9b824c7a00a5e2b06d7d501ea9f549356b433a6867e9bfbbe5c16'
            'd295b4bc474dc0239731b14c13c4f2d25eb6ebc7b057a202538e6adf6a775827')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}