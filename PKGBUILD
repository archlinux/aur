# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nudge
_appname=Nudge
pkgver=0.4
pkgrel=3
pkgdesc="An electron-powered application focused on personal health"
arch=('any')
url="https://github.com/aasmart/Nudge"
license=('MIT')
conflicts=("${pkgname%}")
depends=('bash' 'electron23')
makedepends=('npm' 'gendesk' 'nodejs>=16' 'asar')
source=("${pkgname%}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%}".sh)
sha256sums=('09385528d5cbe1493fbd6b2621705995ccb5f2dbe61d4ada731d1f53f07cd105'
            '6d34a7cbfab9f06271b96b7d3739ba7f59845ad046db2c29c30e794184e37dea')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    sed '19,22d' -i forge.config.js
    npm install --force
    chmod +x node_modules/.bin/electron-forge
    npm run package
    asar p "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%}.png"
    install -Dm644 "${srcdir}/${pkgname%}.desktop" -t "${pkgdir}/usr/share/applications"
}