# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=favicon-generator
pkgver=0.1.1
pkgrel=5
pkgdesc="Small Electron based app to generate favicon in different formats."
arch=('x86_64')
url="https://github.com/anthonypauwels/favicon-generator"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'electron14'
    'python'
    'libvips'
)
makedepends=(
    'npm>=9.0.0'
    'nvm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            '1eda41d0e7fce61972e6517722f89aa84c5b3adddf94bcb2f2058abbef5e1718')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "Graphics;Utility" --name "Favicon Generator" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install  --cache "${srcdir}/npm-cache"
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}