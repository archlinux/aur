# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bear-graph
_pkgname="Bear Graph"
pkgver=1.0.0
_electronversion=25
pkgrel=3
pkgdesc="Graph view of notes from Bear.app"
arch=('x86_64')
url="https://github.com/Chuckleroot/bear-graph"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
    'node-gyp'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'c30a35bf791782272b394741ec9272a4cfdb3fb7669effaee86a7f65a294be91')
build() {
    sed -i "s|@electronversion@|${_electronversion}|" "$srcdir/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}