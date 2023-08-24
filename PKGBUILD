# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru
_pkgname=Miteiru
pkgver=2.2.0
pkgrel=1
pkgdesc="An open source Electron video player to learn Japanese. It has main language dictionary and tokenizer (morphological analyzer), heavily based on External software MeCab"
arch=('any')
url="https://github.com/hockyy/miteiru"
license=(custom)
depends=('electron21' 'mecab')
makedepends=('npm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('aba14b39d350a88eee9d8639730e829a82157ccbd01ac0a210d98dc3aa764b06'
            '0313435e970b7b7b6b3c07a3a15965f8aebcacafac8097a499044391ed26f50a')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed '26d' -i package.json
    sed '10,22d' -i package.json
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "_pkgname" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}