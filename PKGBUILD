# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_githuburl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm>=8.19.0' 'nodejs>=18.17.0')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/core@${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('f1125deaef02819ea67506f16aadc34f963c791ea3e5c6d9cf7fadeee2da5e49'
            'e1f4bb1b5904e927b90e3a15bed63a0d9d893f45492c178ca1457bb1038000dc')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
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