# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="thorium-reader"
pkgname="${_pkgname}-git"
pkgver=2.3.0.r29.gec61bea8
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
arch=('any')
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
conflicts=(
    "${_pkgname}"
)
provides=(
    "${_pkgname}"
)
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs>=18.0.0'
    'npm>=9.0.0'
)
_pkgsrc="${_pkgname}"
source=(
    "${_pkgsrc}"::"git+${url}.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            'b4b89c1666a3893cf0e3733301cc328f81b70915b9e8041fe872d6d21b9c0e83')
pkgver() {
    cd "${_pkgsrc}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
    gendesk -q -f -n --categories "Utility" --pkgname="${_pkgname}" --name="Thorium Reader" --exec="${_pkgname}"
}
build() {
    cd "${_pkgsrc}"
    npm ci
    npm run package:pack-only
}
package() {
    install -Dm755 "${srcdir:?}/${_pkgname}.sh" "${pkgdir:?}/usr/bin/${_pkgname}" 
    install -Dm644 "${srcdir:?}/${_pkgsrc}/release/linux-unpacked/resources/app.asar" -t "${pkgdir:?}/usr/lib/${_pkgname}/"
    install -Dm644 "${srcdir:?}/${_pkgsrc}/resources/icon.png" "${pkgdir:?}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir:?}/${_pkgname}.desktop" -t "${pkgdir:?}/usr/share/applications/"
    install -Dm644 "${srcdir:?}/${_pkgsrc}/LICENSE" -t "${pkgdir:?}/usr/share/licenses/${pkgname}"
}