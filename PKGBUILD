# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.0.0_beta.2
pkgrel=1
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=('any')
url="https://github.com/ollm/OpenComic"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron26' 'hicolor-icon-theme' 'pango' 'libpng' 'glib2' 'gcc-libs' 'freetype2' 'cairo' 'glibc' \
    'giflib' 'libjpeg-turbo' 'librsvg' 'python' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('6d35f2b72ad1557dd7f02a41d6a6a64386c18e50afad303a9e6fe97dff6e0a78'
            'd7f50b421b2f7d1b6c2e97708ae94823feee75d4a2f6dc4d8f5dd1c5eaa62428')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install --force
    sed "s|--linux deb rpm AppImage 7z|--linux AppImage|g" -i package.json
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
