# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.0.0_beta.4
pkgrel=1
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=('any')
url="https://github.com/ollm/OpenComic"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk' 'npm>=8.9.0' 'nodejs' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('c04d7ab0de3059b59e1943c02127774046ecf535c6e7aff6741bf7d00344b69c'
            '96ad66376367ab59cb392adaaf54a3600858090db61d019863482fdd19c8e8c4')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install --force
    npm run build-appimage
    asar e "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app-update.yml" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}