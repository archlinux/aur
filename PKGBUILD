# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snippet-notes
pkgver=0.3.1
pkgrel=1
pkgdesc="效能笔记，一款快速记录及搜索功能增强的本地笔记记录软件.A local note-taking software with quick recording and enhanced search capabilities."
arch=('x86_64')
url="https://github.com/xunxun10/snippet-notes"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'nodejs>=18' 'npm>=9' 'asar' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('eb6eba595e5859d9f1b97a7214bd9a37be3b1a02093f5b3c863ec936b19c6e87'
            'a40955bdc07eeb9118176c0ab2fd612e2f87fcf27d184396731e0c3d5164c908')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed "s|--win|--linux AppImage|g" -i package.json
    npm run dist
    asar extract "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    convert "${srcdir}/${pkgname}-${pkgver}/res/img/${pkgname//notes/note}.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}