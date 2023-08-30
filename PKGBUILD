# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-stitching
_pkgname="${pkgname}-electron-app"
pkgver=1.1.0
pkgrel=1
pkgdesc="This Image Stitcher was specifically built to stitch images in a horizontal layout one after the other from left to right. Primarily used for stitching multiple seperate images of a single scratch together."
arch=('x86_64')
url="https://github.com/DevanshuSawant/image-stitching-electron-app"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'nodejs' 'npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('b159605e24fde9f7c8578918e9d42c54d5e8e81d600d1e4df438f8f3733233aa'
            'b802d7f61690b3cab04acefc151005c220527694af69a10c0e6a3f006c542321')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    sed '19,22d' -i forge.config.js
    sed "s|AI Image Stitcher|${pkgname}|g" -i package.json
    npm run make
    asar pack "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/square-smt-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}