# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=photo-location-map
_pkgname="Photo Location Map"
pkgver=1.9.0
pkgrel=1
pkgdesc="Display the locations where photos were taken on a map. "
arch=('x86_64')
url="https://tomoyukiaota.github.io/photo-location-map/"
_githuburl="https://github.com/TomoyukiAota/photo-location-map"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'nodejs>=18' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7b52017ea897316582c93e8fe59512c5eb36b9029ca0021c9045f147e0f8299e'
            'f0e0921b786b5c38eb74a9e3ae1a6925f0fc20b73401d3834659d77d962487d3')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force
    npm run electron-builder:linux
    asar p "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/favicon.512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}