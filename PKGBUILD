# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snippet-notes
pkgver=0.2.0
pkgrel=1
pkgdesc="效能笔记，一款快速记录及搜索功能增强的本地笔记记录软件.A local note-taking software with quick recording and enhanced search capabilities."
arch=('x86_64')
url="https://github.com/xunxun10/snippet-notes"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'nodejs' 'npm' 'asar' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('e8b6ac0694f49c3cd3981aa044c44ef54275965df04df3fbc66ae1ffb3c0c992'
            'a78e993589014f66d9c3df2711f2ada4e0edb64cd609224a865fbad2859eb712')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed "s|--armv7l|AppImage|g" -i package.json
    npm run _dist
    asar extract "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
    convert "${srcdir}/${pkgname}-${pkgver}/res/img/${pkgname//notes/note}.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}