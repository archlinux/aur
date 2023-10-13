# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=screen-recorder-app
pkgver=1.0.0
pkgrel=2
pkgdesc="A small video recorder application, built with Electron and tailwindcss."
arch=('x86_64')
url="https://github.com/petya0927/screen-recorder-app"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('38791afdcc7a735b40ce92f98239faac10608fcfea56153f10c0dbe00317c0f2'
            '8cb028c093a9c294031843220d8aa9e6d5253dbae60dd6073387755ae0603975')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '18,21d' -i forge.config.js
    npm install --force
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icons/screen-share-off.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}