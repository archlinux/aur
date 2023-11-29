# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snippet-notes
pkgver=0.3.3
pkgrel=1
pkgdesc="效能笔记，一款快速记录及搜索功能增强的本地笔记记录软件.A local note-taking software with quick recording and enhanced search capabilities."
arch=('x86_64')
url="https://github.com/xunxun10/snippet-notes"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron22'
    'python'
)
makedepends=(
    'gendesk'
    'nodejs>=18'
    'npm>=9'
    'git'
    'make'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '4a3f3c28c8ee36f5b374e74cea9b25d7dabd87aa8bb965c553fe050522fad633')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install  --cache "${srcdir}/npm-cache"
    sed "s|--win|--linux AppImage|g" -i package.json
    npm run dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/img/${pkgname//es/e}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}