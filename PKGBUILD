# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-deno-ide
_pkgname=electron-deno-IDE
pkgver=0.1.1_beta
pkgrel=1
pkgdesc="Deno IDE supported all of programming language"
arch=('x86_64')
url="https://github.com/MooudMohammady/electron-deno-IDE"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('c51758b98d8a43338e85b2e02aba8283c488ca090e2163bce45ec7b1c01ddb4f'
            '98686834b88cdb97aefe636d985343d56b1e83006568b14d3278ff3270259f30')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install
    sed '29d' -i package.json
    sed 's|win|linux|g;s|"nsis",|"AppImage",|g' -i electron-builder.json5
    npm run build
    asar extract "${srcdir}/${_pkgname}-${pkgver//_/-}/release/0.0.1/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/release/0.0.1/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}