# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
_pkgname=Open-eCard-App
pkgver=2.3.6
pkgrel=1
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727.Prebuilt version."
arch=('x86_64')
url="http://www.openecard.org/"
_ghurl="https://github.com/ecsec/open-ecard"
license=(
    "Apache-2.0"
    "LicenseRef-BouncyCastle"
    "GPL-3.0-only"
    "GPL-2.0-only"
    "LGPL-3.0-only"
    "MIT"
)
provides=("${pkgname%-app-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "openecardapp"
)
depends=(
    'java-runtime'
    'alsa-lib'
    'libjpeg6-turbo'
    'pcsclite'
    'libxtst'
    'libxrender'
    'libx11'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "License-BouncyCastle-${pkgver}::https://raw.githubusercontent.com/ecsec/open-ecard/v${pkgver}/LICENSE.BouncyCastle"
    "License-MIT-${pkgver}::https://raw.githubusercontent.com/ecsec/open-ecard/v${pkgver}/LICENSE.MIT"
    "${pkgname%-bin}.sh"
)
sha256sums=('48c2c107c03d56b9d791098eda384de5f084ffee119e72a3c1b2e2a98f28e185'
            '8137d0fbe30981aa23ee0507994b5af3fb8ead0336c3c1a1bb637be4c01e86e9'
            '21366ef752c0c7fbf91c46ff163212d3991c6f31cf5edd216467966c50783e7e'
            'b8f91b2c58c9a52fdd956fbbf13e82ac8f404b3cce08cb1dae40f50634ec5af4')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/${pkgname%-bin}/
        s/\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/${pkgname%-bin}/
    " -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/License-BouncyCastle-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/License-BouncyCastle"
    install -Dm644 "${srcdir}/License-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/License-MIT"
}
