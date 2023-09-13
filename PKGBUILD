# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas
_pkgname=Commas
pkgver=0.27.0
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm>=9' 'nodejs>=18')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9fc971ec6ae8acf5fb0f3abb8235fd7c3cd99c9b5baadbacc1a6dc413fae7911')
prepare() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|App.vue|app.vue|g" -i src/renderer/app.ts
    #For Chinese Only
    #sed "s|https://registry.npmjs.org|https://registry.npm.taobao.org|g" -i .npmrc
    npm install
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}