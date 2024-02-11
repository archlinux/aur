# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
pkgver=2.1.11
pkgrel=3
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
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
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8dac0112b8a7c908a8b2a96d61d5396cec23a6031205893bd4d14c372589e002'
            '4d643503ce289625d6d8d3b2025a8e7a0647014f7c79b0ec1e0747a44a29b887')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/bin/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt/" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}