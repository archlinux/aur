# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revezone
pkgver=1.0.0_alpha.3
pkgrel=1
pkgdesc="A new way to use Excalidraw. A lightweight productivity tool to build Second Brain that integrates Notion-like note-taking and enhanced Excalidraw whiteboarding features."
arch=('any')
url="https://revezone.com/"
_githuburl="https://github.com/revezone/revezone"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('nodejs' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('a695bdaf54e6ac57dbbaed06d6c467e382322876c0ee760ad425f7391bea49b4'
            '2a16e120cd78d0703afafaffd94d8ccabda10c7b12d54cc59ccbb97a7b7e8656')
build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    pnpm i
    pnpm update
    sed '34,35d' -i electron-builder.yml
    pnpm add builder-util-runtime debug ms sax fs-extra universalify graceful-fs jsonfile js-yaml lazy-val semver lru-cache
    pnpm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}