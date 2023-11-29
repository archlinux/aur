# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nudge
_appname=Nudge
pkgver=0.4
pkgrel=4
pkgdesc="An electron-powered application focused on personal health"
arch=('any')
url="https://github.com/aasmart/Nudge"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron23'
)
makedepends=(
    'npm'
    'gendesk'
    'nodejs>=16'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'e2d59bc471de1b650e683a2e2661bdae8f831cdb1da5bac9d52819304ced1a72')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '19,22d' -i forge.config.js
    npm install  --cache "${srcdir}/npm-cache"
    chmod +x node_modules/.bin/electron-forge
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}