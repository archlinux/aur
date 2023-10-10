# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.0.0_beta.3
pkgrel=1
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=('any')
url="https://github.com/ollm/OpenComic"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron27' 'hicolor-icon-theme' 'pango' 'libpng' 'glib2' 'gcc-libs' 'freetype2' 'cairo' 'glibc' \
    'giflib' 'libjpeg-turbo' 'librsvg' 'python' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('asar' 'gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('49ba7820362d702e551847d7a2bbea7fc5fdb71c4d6aa3dd17c8a63a65045be9'
            'b1303ef6ac5e079c64e0d2b9186b8339fa949c61e7cb83630cbe42b0f203acd8')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
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