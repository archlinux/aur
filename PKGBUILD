# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revezone
pkgver=1.0.0_alpha.17
pkgrel=2
pkgdesc="A new way to use Excalidraw. A lightweight productivity tool to build Second Brain that integrates Notion-like note-taking and enhanced Excalidraw whiteboarding features."
arch=('any')
url="https://revezone.com/"
_ghurl="https://github.com/revezone/revezone"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'nodejs>=18'
    'pnpm'
    'npm>=9'
    'gendesk'
    'asar'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '14003c4ba672a828669203325bb05a8ba77d78c80028219bc6102958aec25185')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    sed '/snap/d;/deb/d' -i electron-builder.yml
    pnpm add builder-util-runtime debug ms sax fs-extra universalify graceful-fs jsonfile js-yaml lazy-val semver lru-cache conf
    pnpm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}