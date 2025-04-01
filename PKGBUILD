# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
_pkgname=Open-eCard-App
pkgver=2.3.11
pkgrel=1
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727.(Prebuilt version)"
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
    'jdk17-openjdk'
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
sha256sums=('1b24f2b647a4f1d62bcda41f192ee949cf06eec7f5214653806462914876b702'
            '8137d0fbe30981aa23ee0507994b5af3fb8ead0336c3c1a1bb637be4c01e86e9'
            '21366ef752c0c7fbf91c46ff163212d3991c6f31cf5edd216467966c50783e7e'
            '108b544e799c3460c0f2b430e84446a38ea2c67ccd7ea842329ab8102f5fc606')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/${pkgname%-bin}/
        s/\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/${pkgname%-bin}/
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
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