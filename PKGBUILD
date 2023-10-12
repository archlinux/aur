# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=datefile
_appname=DateFile
pkgver=0.1.0
pkgrel=3
pkgdesc="Index files in a directory using the date of another file as a filter"
arch=('x86_64')
url="https://github.com/kna40/DateFile"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('2b6fe8fbfd9531233f43123cb962544725daf5a3055070ea32e4d7b923d560d3'
            '6a4495c353fd0ff229086cb85d04eceae969f8c429fb11a8d335e45e8b16e203')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    sed "15s|--out=./.bin|--out=./out|g" -i package.json
    npm install
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/assets/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}