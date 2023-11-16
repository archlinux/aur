# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru
_pkgname=Miteiru
pkgver=2.2.0
pkgrel=3
pkgdesc="An open source Electron video player to learn Japanese. It has main language dictionary and tokenizer (morphological analyzer), heavily based on External software MeCab"
arch=('any')
url="https://github.com/hockyy/miteiru"
license=("custom")
conflicts=("${pkgname}")
depends=(
    'electron21'
    'mecab'
    'mecab'
    'java-runtime'
    'lib32-glibc'
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('aba14b39d350a88eee9d8639730e829a82157ccbd01ac0a210d98dc3aa764b06'
            '3e834169a0ac9dc85a39c5f914c0335bd73655d4c622ba205d11b7f0115aa3dc')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "_pkgname" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed '26d' -i package.json
    sed '10,22d' -i package.json
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}