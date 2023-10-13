# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-deno-ide
_pkgname=electron-deno-IDE
pkgver=0.1.1_beta
pkgrel=2
pkgdesc="Deno IDE supported all of programming language"
arch=('x86_64')
url="https://github.com/MooudMohammady/electron-deno-IDE"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver//_/-}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('90b16d69f1b3dd2b5b2610ccd3976a391c6c1d1c1e5991e132177739caedbdcd'
            'fe810b4a8d4b2e6187eeb1529ccb89430bec85ee7e1791662c2361161aaf6b43')
prepare() {
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    sed '/"electron-rebuild":/d' -i package.json
    sed 's|win|linux|g;s|"nsis",|"AppImage",|g' -i electron-builder.json5
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/release/0.0.1/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}