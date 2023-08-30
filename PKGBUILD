# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seven-waves
_pkgname=7-Waves
pkgver=1.2.0
pkgrel=1
pkgdesc="A dodging game with 7 levels of increasing difficulty"
arch=('x86_64')
url="https://github.com/Togohogo1/7-Waves"
license=("custom:CC0-1.0")
conflicts=("${pkgname}")
depends=('bash' 'electron')
makedepends=('gendesk' 'npm' 'yarn' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('80ba41476b3bcfa8421a5b28348e0f5387a8f6ef6854ede25cb9a7cb59aaa8b8'
            '2b582ac319715a10d1a90d1d80680032bfe1e88a8c0a244e206078230e38b117')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    yarn install
    sed "s|builder build|builder --linux AppImage|g" -i package.json
    yarn dist
    convert "${srcdir}/${_pkgname}-${pkgver}/assets/flag.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-8.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}