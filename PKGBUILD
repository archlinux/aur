# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encrypt0r-bin
pkgver=3.11.69
_electronversion=22
pkgrel=1
pkgdesc="App to encrypt and decrypt your files with a passphrase, powered by electron"
arch=('x86_64')
url="https://www.kunalnagar.in/blog/encryptor-encrypt-decrypt-files-passphrase/"
_ghurl="https://github.com/kunalnagar/encrypt0r"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-deb.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kunalnagar/encrypt0r/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('66ec34924a1229c5f507b80bd83e3aee9c7578de8406d31be62e692cf1743dda'
            'dd8cfe4d2d540a3c670cf0aa6c95e9076e8949d7c50d04495feb0a6ce9d82cc3'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/release-builds/${pkgname%-bin}_0.0.0_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}