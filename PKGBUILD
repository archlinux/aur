# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wubi-dict-editor
_zhname="五笔码表助手"
pkgver=1.21
pkgrel=3
pkgdesc="五笔码表助手 for Rime ( Windows、macOS、Ubuntu ) 基于 electron 开发."
arch=("x86_64")
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL3')
depends=('ibus-rime' 'electron24')
makedepends=('npm>=9' 'yarn' 'asar' 'nodejs>=18' 'imagemagick')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('8948abfa58980007c8b352bd953672693f23b264e68d9350a7739db01506d7f5'
            'b70f00f133517296d81cb0f546a70539b46ebaf82baeab7adec13056bc42ec12'
            'ef6e64129224e6860e191fd8905d8fd111ad88b8a9d08b32b7c02629b6297461')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    1yarn install 
    yarn package
    asar pack "${srcdir}/${pkgname}-${pkgver}/out/${_zhname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
    convert "${srcdir}/${pkgname}-${pkgver}/assets/img/appIcon/appIcon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-3.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --genericname="${_zhname} for Rime" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}