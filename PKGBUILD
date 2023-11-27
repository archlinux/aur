# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=datefile
_appname=DateFile
pkgver=0.1.0
pkgrel=4
pkgdesc="Index files in a directory using the date of another file as a filter"
arch=('x86_64')
url="https://github.com/kna40/DateFile"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'cff8a50781faa1182eea8c2a6a9561f24627c60ad4e170174aed462125c7ef31')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "15s|--out=./.bin|--out=./out|g" -i package.json
    npm install --cache "${srcdir}/npm-cache"
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}