# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium
pkgver=0.2.1_b
pkgrel=1
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_githuburl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm>=8.19.0' 'nodejs>=18.17.0')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/core@${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('e7e199d5a5ecd4a307dec9f37b29bbc7e4e6e4b638ce5537f4bf2fdd9ef811bc'
            'e1f4bb1b5904e927b90e3a15bed63a0d9d893f45492c178ca1457bb1038000dc')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-core-${pkgver//_/-}"
    sed '121,132d' -i packages/insomnia/electron-builder.config.js
    npm ci
    npm run app-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm755 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/bin/yarn-standalone.js" -t "${pkgdir}/opt/${pkgname}/resources/bin"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/dist/linux-unpacked/resources/opensource-licenses.txt" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/packages/insomnia/build/static/insomnia-core-logo_16x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-core-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}