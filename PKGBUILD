# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wubi-dict-editor
_zhname="五笔码表助手"
pkgver=1.22
pkgrel=1
pkgdesc="五笔码表助手 for Rime ( Windows、macOS、Ubuntu ) 基于 electron 开发."
arch=("x86_64")
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'ibus-rime'
    'electron24'
)
makedepends=(
    'npm>=9'
    'yarn'
    'nodejs>=18'
    'gendesk'
    'imagemagick'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc3a133add1ec4b5e06160b475480614b39490f0e95655c6ae027d169ea6802b')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --genericname="${_zhname} for Rime" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install 
    yarn package
    convert "${srcdir}/${pkgname}-${pkgver}/assets/img/appIcon/appIcon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_zhname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-3.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}