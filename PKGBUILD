# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium
pkgver=0.2.3_a
pkgrel=1
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_githuburl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'gendesk'
    'npm>=8.19.0'
    'nodejs>=18.18.2'
)
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/core@${pkgver//_/-}.zip"
    "${pkgname}.sh")
sha256sums=('c22153b9b8038d26d9963a009cc0feb4c1dab2185825fc9ed8e6b7faae813b5b'
            'dbfed08af3bf3c3b299320895a8a4d3cf4611c2a433056cc28a50fa74e785d00')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-core-${pkgver//_/-}"
    sed '121,132d' -i packages/insomnia/electron-builder.config.js
    npm ci
    npm run app-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}/resources"
    install -Dm755 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/bin/yarn-standalone.js" -t "${pkgdir}/usr/lib/${pkgname}/bin"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/opensource-licenses.txt" -t "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/build/static/insomnia-core-logo_16x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}