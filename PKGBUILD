# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=neoplayer-bin
_pkgname=NeoPlayer
pkgver=1.1.0
_electronversion=36
pkgrel=1
pkgdesc="A module player built with Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/lucmsilva651/NeoPlayer"
license=('BSD-3-Clause')
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/linux-build.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/lucmsilva651/NeoPlayer/v${pkgver}/app/icons/png/512x512.png"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/lucmsilva651/NeoPlayer/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('e1014cc46c8c34eef46777372050e8ac59ccfdfaf9ac47d6ab13f2cd1a4bfb32'
            '833d907571bd88c4b9c11751ccfeb7b6d501aa646d2b57a082f9b9723e2999f9'
            'ec821629b10d9213f7dd7d57f7f33a6a3083dc26da59ccbd6fd8b6ea132d3aff'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
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
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE/.txt"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}