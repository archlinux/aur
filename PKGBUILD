# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cycode
_pkgname=CyCode
pkgver=1.3.1
_electronversion=28
pkgrel=1
pkgdesc="A web-based HTML Editor, Markdown Editor, and WYSIWYG Editor,a code editor with a primary focus on web development."
arch=('x86_64')
url="https://github.com/magayagalabs/CyCode"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nodejs'
    'npm'
    'git'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '68521cf799a902fb3c86aa1ebdcfa92566ee49621b0e1db5873a0501d893b2e6')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname}"
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run download-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release-builds/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/img/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}