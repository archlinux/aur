# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
pkgname=nuclear-player
pkgver=0.6.30
pkgrel=2
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('any')
url="http://nuclear.gumblert.tech/"
_githuburl="https://github.com/nukeop/nuclear"
license=('GPL3')
depends=('bash' 'electron12')
makedepends=('gendesk' 'npm>=8.0.0' 'nodejs>=18.0.0' 'make' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('ba98bb6e4766c8a63ddba0254e4b9a80197196dea8b7f4a73693ba4602ebfdf4'
            '200b71666dd12149ef2eee2426d7115ead1b460b7aed196f5b1c1354c5feba84')
prepare() {
    gendesk -q -f -n --categories "AudioVideo" --name "Nuclear Player" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname%-player}-${pkgver}"
    sed -e 's|"AppImage",|"AppImage"|g;s| --publish onTag||g;s|env.VERSION|version|g' \
        -e '157,160d' \
        -i package.json
    npm ci
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname%-player}-${pkgver}/release/linux-unpacked/resources" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-player}-${pkgver}/packages/app/resources/media/1024x1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}