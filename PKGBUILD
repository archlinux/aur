# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium
pkgver=0.2.2
pkgrel=1
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_githuburl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm>=8.19.0' 'nodejs>=18.18.2')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/core@${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('d87ae7b389b95e986ea5032805b8666588460b677a845b02cc24f0ab7fcd73d6'
            'f79e0ed67ab6ecd1b12911ada4f868ce8810b19c19012d6666cfb8b0552df45a')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-core-${pkgver}"
    sed '121,132d' -i packages/insomnia/electron-builder.config.js
    npm ci
    npm run app-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm755 "${srcdir}/${pkgname}-core-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/bin/yarn-standalone.js" -t "${pkgdir}/opt/${pkgname}/resources/bin"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver}/packages/insomnia/dist/linux-unpacked/resources/opensource-licenses.txt" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver}/packages/insomnia/build/static/insomnia-core-logo_16x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}