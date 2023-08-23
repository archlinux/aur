# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.0.0_beta.1
pkgrel=1
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=('any')
url="https://github.com/ollm/OpenComic"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme' 'pango' 'libpng' 'glib2' 'gcc-libs' 'freetype2' 'cairo' 'glibc' \
    'giflib' 'libjpeg-turbo' 'librsvg' 'python' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('df93a6d17ae60e29f9d832c183f3aacb8893d181792ca6a6fa548bd9dc5acd3a'
            '5effa90ca08200d031f3f4de3e77fd2940f7ea749c1554fba6a6cb150f5c4343')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install
    sed "s|--linux deb rpm AppImage 7z\",|--linux AppImage\",|g" -i package.json
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}