# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moneydance-bin
_pkgname=Moneydance
pkgver=2024.4
pkgrel=1
pkgdesc="An easy to use and full-featured personal finance app that doesn't compromise your privacy. "
arch=('x86_64')
url="https://infinitekind.com/moneydance"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libx11'
    'libxext'
    'libxi'
    'libxtst'
    'libxrender'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://infinitekind.com/stabledl/current/${pkgname%-bin}_linux_amd64.deb"
)
sha256sums=('8657753d048e3248ad5df34667be4692ff42c82164131d0a82ec4a2fabe0a67a')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --comment="Powerful, private, personal finance software" \
        --categories="Finance;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}" \
        --custom="Keywords=money,budget,budgeting,finance,finances,accounting,investing,investment,stocks,exchangerates,prices,quicken EOS"
    echo "StartupWMClass=moneydance" >> "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{lib/"${pkgname%-bin}",bin}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/."* "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 128x128 512x512;do
        install -Dm644 "${srcdir}/opt/${_pkgname}/resources/${pkgname%-bin}_icon${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
