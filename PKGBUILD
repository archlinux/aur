# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spotbar
_pkgname=Spotbar
pkgver=1.0.0
pkgrel=1
pkgdesc="Small applications that provides Spotify media controls in a window that runs in your macOS/Windows/Linux menu bar"
arch=('any')
url="https://github.com/levarr/Spotbar"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/levarr/Spotbar/main/LICENSE"
    "${pkgname}.sh")
sha256sums=('1172869217e0ddf9a0fd4fbef600072dc9adaa35469bbb77124db9b3b6c20d73'
            '71223174d5542c21fae43d3a237be929f13acb70bed52c43e3a870328e698f97'
            'f057a3225238889a684bdd823ad6445352f6a05f405b70eb89bbbb035720679b')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    sed '33,34d' -i electron-builder.yml
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}