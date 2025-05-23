# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=defi-wallet-bin
_pkgname=DeFi-Wallet
pkgver=4.2.5
_electronversion=27
pkgrel=1
pkgdesc='A wallet for $DFI, wrapped BTC, ETH, USDT. Liquidity mine, use the DEX, create masternodes, and more.(Prebuilt version.Use system-wide electron)'
arch=('x86_64')
url="https://defichain.com/"
_ghurl="https://github.com/DeFiCh/defichain-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/DeFiCh/defichain-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9b7433d047362aa368d1cf6c63e3b78c80d2bcee31188156c4b78594cea85c23'
            'adf996079d0f408011396eed4542cbfefdc11d7e4f5ec9bd13a2de81e7a8c81f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm,arm64,ia32}}
    ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}