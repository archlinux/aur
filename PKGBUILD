# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revezone
pkgver=1.0.0_alpha.17
pkgrel=1
pkgdesc="A new way to use Excalidraw. A lightweight productivity tool to build Second Brain that integrates Notion-like note-taking and enhanced Excalidraw whiteboarding features."
arch=('any')
url="https://revezone.com/"
_githuburl="https://github.com/revezone/revezone"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('nodejs>=18' 'pnpm' 'npm>=9' 'gendesk' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('8a04568fc2c80db24a53ab0aef76b9915ab5c5440c319a3aef4e5e1b4eb9ead1'
            '629038063f6bf56f6077a581c50db9ef77b8aa570e852c702fb97e5c207909a0')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    pnpm i
    sed '/snap/d;/deb/d' -i electron-builder.yml
    pnpm add builder-util-runtime debug ms sax fs-extra universalify graceful-fs jsonfile js-yaml lazy-val semver lru-cache conf
    pnpm run build:linux
    asar e "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}