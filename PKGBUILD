# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cgdi
_pkgname=CGDI
pkgver=0.0.8
pkgrel=2
pkgdesc="Application to calculate duration between 2 dates (Electron app)"
arch=('x86_64')
url="https://github.com/nullfuzz-pentest/CGDI"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'electron23'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=12'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('02115102012acdec1bbe2aed9df1d5a6da6bd91302422d78c6f29251f6b8edef'
            '66fd7ccb81f685488595bcac8b40e1ee0eb1b0b3438034461fe26371c50c3ba8')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/src"
    npm install
    sed "s|win32|linux|g" -i package.json
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}