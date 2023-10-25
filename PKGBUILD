# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wpspaster
pkgver=2.0.1
pkgrel=1
pkgdesc="Free rich text editor image and text pasting.富文本图文粘贴"
arch=('aarch64' 'x86_64')
url="http://xoobom.com:8020/#/rich-text-editor/tinymce"
_ghurl="https://github.com/xoobom/wpspaster"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm>=9' 'nodejs>=18.17.5')
source=("${pkgname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('5d4e69d0fa97505e1d2910ad3e9929b139929484cc67ab325c2ea7ffb2caa655'
            'fd5b2e7bd0ab9bd2fc9f3c421c4c3626f72c45f2df1e5dbd334ca8df95baf009')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}-electron-vite"
    sed "s|--linux|--linux AppImage|g" -i package.json
    npm i
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-electron-vite/dist/electron/linux-unpacked/resources/app.asar" \
        -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/img/${pkgname}-logo-circle.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}