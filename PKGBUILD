# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus
pkgver=4.8.6
pkgrel=5
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('any')
url="https://github.com/amanharwara/altus"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'electron22'
)
makedepends=(
    'yarn'
    'npm'
    'nvm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '97d22512b105afc6ca0441342fb615b561816279e0a6922be82b1e3fff53cb2b')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Network" --name "Altus" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn
    yarn build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}