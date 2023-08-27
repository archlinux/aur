# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swarm-desktop
_pkgname="Swarm Desktop"
pkgver=0.28.0
pkgrel=1
pkgdesc="Electron Desktop app that helps you easily spin up and manage Swarm node"
arch=('x86_64')
url="https://desktop.ethswarm.org/"
_githuburl="https://github.com/ethersphere/swarm-desktop"
license=('BSD')
conflicts=("${pkgname}")
depends=('bash' 'electron18')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('ead3ddf62632e29904a91d380c416e164151e58162d3825a9fdb6d7323448c60'
            'c3b4e9d79b788254845d876932fb30fab247ce46d25962719e75f8640ea3624f')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    cd ./ui
    npm ci
    npm run build:ui
    cd ..
    npm run build
    cp -r ./ui/node_modules/@ethersphere/bee-dashboard/lib/* ./dist/ui/static/js
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}