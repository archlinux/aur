# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium
pkgver=0.2.3_a
pkgrel=2
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_ghurl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=core@${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dbfed08af3bf3c3b299320895a8a4d3cf4611c2a433056cc28a50fa74e785d00')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '121,132d' -i packages/insomnia/electron-builder.config.js
    npm ci --cache "${srcdir}/npm-cache"
    npm run app-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/bin/yarn-standalone.js" -t "${pkgdir}/usr/lib/${pkgname}/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/opensource-licenses.txt" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/insomnia/build/static/insomnia-core-logo_16x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}