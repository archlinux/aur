# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru
pkgver=2.0.0
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
sha256sums=('3dc875943bdcdcefddf35b4e6ee18112b0a2285dc6b198f33019caad896258e7'
            'df117d451c5c7fb4ca99920810b23d98ba1bd986501be11194eab27841962b18')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed 'N;7a\  "homepage": "https://github.com/hockyy/miteiru",' -i "${srcdir}/${pkgname}-${pkgver}/package.json"
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "Miteiru" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}