# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swarm-desktop
_pkgname="Swarm Desktop"
pkgver=0.31.0
pkgrel=1
pkgdesc="Electron Desktop app that helps you easily spin up and manage Swarm node"
arch=('x86_64')
url="https://desktop.ethswarm.org/"
_githuburl="https://github.com/ethersphere/swarm-desktop"
license=('BSD')
conflicts=("${pkgname}")
depends=('bash' 'electron18-bin')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('9bf8aae4a3b8a928c222a0c37d77be574ca5c3a0995c67de94ab5d28b72cdcf8'
            'ab480df5575f3735b9ed963c66de675c219dd58b6bfbef1f64a028bba789e144')
build() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    cd ./ui
    npm ci
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm run build
    cp -r ./ui/node_modules/@ethersphere/bee-dashboard/lib/* ./dist/ui/static/js
    npx rimraf ./ui
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources/app.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}