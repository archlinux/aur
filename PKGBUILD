# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
_pkgname=Mingo
pkgver=1.14.1
_electronversion=27
pkgrel=1
pkgdesc="A proprietary MongoDB GUI based on electron from developers for developers"
arch=(
    'aarch64'
    'x86_64'
)
url="https://mingo.io"
_ghurl="https://github.com/mingo-app/mingo"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libsecret'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}.html::${url}/eula"
    "${pkgname%-bin}.sh"
)
sha256sums=('55f554ca553f458700927b374d1ffb390a13c42bd082b986b626f1410c92a842'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('d1d47b9c3e860fd5d198c7e03976383c8b47b6d1f5f989d7a495f9815c2c9f02')
sha256sums_x86_64=('a8675bf3d08815a9e77f97be3f2827ccd53aab0d79ee8b6a3d27398abd3f1eaa')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}