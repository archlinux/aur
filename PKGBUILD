# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chain-desktop-wallet-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Crypto.com DeFi Desktop Wallet"
arch=('x86_64')
url="https://crypto.com/defi-wallet"
_githuburl="https://github.com/crypto-com/chain-desktop-wallet"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('e3dffdf9f12cbb2cf800a80c3f2e520d842a1525d43844cc544cd2599b773e68'
            '091d1f9251158c9d6503cae3a5c60f21697957a9c5bbacc0c9dfa1e037f2bbf4')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/resources/scripts/preload.js" -t "${pkgdir}/opt/${pkgname%-bin}/resources/scripts"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}