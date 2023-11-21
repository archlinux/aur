# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flashpoint-launcher
_pkgname="Flashpoint Launcher"
pkgver=12.1.1
pkgrel=2
pkgdesc="A desktop application used to browse, manage and play games from Flashpoint Archive"
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
_ghurl="https://github.com/FlashpointProject/launcher"
license=('MIT')
conflicts=("${pkgname}" "${pkgname%-launcher}")
depends=(
    'electron19'
    'python'
    'flashpoint'
)
makedepends=(
    'gendesk'
    'npm>=8'
    'nodejs>=16.20.1'
    'rust'
    'yarn'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '128a42c87f7d95279ea26f53f3c4091f3471230fb92fdd63dfa8c61b109db8ee')
build() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|PUBLISH=true|PUBLISH=false|g" -i package.json
    sed "2i process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" -i build/main/index.js
    yarn --cache-folder "${srcdir}/npm-cache" 
    sed 's|"deb", ||g' -i gulpfile.js
    yarn release:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"{extern,lang,licenses,resources} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}