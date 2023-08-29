# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=discord-netflix
_pkgname=Discord-Netflix
pkgver=1.1.11
pkgrel=1
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_githuburl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron21')
makedepends=('gendesk' 'nodejs>=7' 'npm' 'python>=3.9.0' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('e65b8911b39fa14c6ba5b07d4bd6df7d2fea43f5a354ed3cd3d059e80faa8410'
            '1bf32b5c6ce2d8d562816cb5b9b4fdbe8dc26ab730962e74d60be27b8a30ea03')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run linbuild
    asar extract "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}