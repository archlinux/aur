# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chain-desktop-wallet-bin"
pkgver=1.4.1
pkgrel=3
pkgdesc="Crypto.com DeFi Desktop Wallet"
arch=('x86_64')
url="https://crypto.com/defi-wallet"
_githuburl="https://github.com/crypto-com/chain-desktop-wallet"
license=("Apache")
depends=('electron' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('5920c47e39791d645a973b70f17545ffc5f3d20b24dccc5c9907abaa66606f42'
            'a5541536cc9f53a94910775fe033803e9f95b8e33103cd6edbfa2ce726771498')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}