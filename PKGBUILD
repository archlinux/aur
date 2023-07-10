# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="datefile"
_appname="DateFile"
pkgver=0.1.0
pkgrel=1
pkgdesc="Index files in a directory using the date of another file as a filter"
arch=('x86_64')
url="https://github.com/kna40/DateFile"
license=('MIT')
conflicts=("${pkgname}")
depends=('electron')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('2b6fe8fbfd9531233f43123cb962544725daf5a3055070ea32e4d7b923d560d3'
            'e74688e853e228efcaecbbe8bf3fdf1e9ab2cf34313b6233412380ba63f4db73')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    sed "15s|--out=./.bin|--out=./out|g" -i package.json
    npm install && npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/assets/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}