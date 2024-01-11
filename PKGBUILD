# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
pkgver=2.1.11
pkgrel=2
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
arch=('x86_64')
url="http://www.openecard.org/"
_ghurl="https://github.com/ecsec/open-ecard"
license=("Apache" "custom:BouncyCastle" "GPL" "GPL2" "LGPL" "MIT")
provides=("${pkgname%-app-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "openecardapp"
)
depends=(
    'java-runtime'
    'lcms2'
    'libx11'
    'libxrender'
    'libjpeg6-turbo'
    'libxext'
    'libpng'
    'harfbuzz'
    'libxi'
    'libxtst'
    'pcsclite'
    'giflib'
    'freetype2'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8dac0112b8a7c908a8b2a96d61d5396cec23a6031205893bd4d14c372589e002'
            '46e687c9987c2fbcc8512d8e909cd23c48f6bacbeb9b162fd9374e7193bb0bb2')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/bin/${pkgname%-bin}|${pkgname%-bin}|g;s|.png||g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt/" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}