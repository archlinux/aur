# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r5-wallet-bin
_pkgname='R5 Wallet'
pkgver=1.0.3_beta
_electronversion=35
pkgrel=1
pkgdesc="Open source community implementation of the R5 Network GUI desktop wallet in TypeScript/Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://r5.network/"
_ghurl="https://github.com/r5-labs/r5-wallet"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/r5_desktop_wallet_103_linux_x86-64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/r5-labs/r5-wallet/main/electron/src/ui/assets/${pkgname%-bin}.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('1a42d25043aba8f3aa0e278fe7799e33116302e87eef7496d2810e550bd9d239'
            'e0cd5eccc850b6563fc216a6f6cd7ba6b9e76e99abe10dfe82e3672d14711ca5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/R5 Desktop Wallet/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//_beta/}/resources/app.asar"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}