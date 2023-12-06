# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=waveterm
_pkgname=Wave
pkgver=0.5.1
_electronversion=27
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=(
    'x86_64'
)
url="https://www.waveterm.dev/"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gcc'
    'yarn'
    'gendesk'
    'npm'
    'nodejs>=20'
    'git'
    'go>=1.18'
    'scripthaus'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    yarn --cache-folder "${srcdir}/.yarn_cache"
    scripthaus run electron-rebuild
    scripthaus run build-backend
    scripthaus run build-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/app/assets/${pkgname}-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}