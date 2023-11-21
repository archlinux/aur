# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=photo-location-map
_pkgname="Photo Location Map"
pkgver=1.9.0
pkgrel=2
pkgdesc="Display the locations where photos were taken on a map. "
arch=('x86_64')
url="https://tomoyukiaota.github.io/photo-location-map/"
_ghurl="https://github.com/TomoyukiAota/photo-location-map"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron22'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=18'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh")
sha256sums=('SKIP'
            '4d51569c4e39eb4ad610dea46e954f2fa1fd33d6eac44ba92fcb7450fc894951')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci --cache "${srcdir}/npm-cache"
    npm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/favicon.512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}