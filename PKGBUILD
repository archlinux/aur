# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-stitching
_pkgname="${pkgname}-electron-app"
pkgver=1.1.0
pkgrel=2
pkgdesc="This Image Stitcher was specifically built to stitch images in a horizontal layout one after the other from left to right. Primarily used for stitching multiple seperate images of a single scratch together."
arch=('x86_64')
url="https://github.com/DevanshuSawant/image-stitching-electron-app"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'nodejs>=14.17.5' 'npm' 'asar')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('095c85a58688373ec216b8388590cfb7031d01b9fced888be5892359c43112af'
            'dc508084ae674c0a2422bc185940f64865e1e2661c01d33e8af0bf6d521147ec')
prepare() {
    gendesk -q -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    sed '23,26d' -i forge.config.js
    sed "s|AI Image Stitcher|${pkgname}|g" -i package.json
    npm run package
    asar p "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/square-smt-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}