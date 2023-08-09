# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
pkgname=nuclear-player
pkgver=0.6.30
pkgrel=1
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('any')
url="http://nuclear.gumblert.tech/"
_githuburl="https://github.com/nukeop/nuclear"
license=('GPL3')
depends=('bash' 'electron12' 'python' 'gcc-libs' 'glibc')
makedepends=('gendesk' 'npm' 'nodejs' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('ba98bb6e4766c8a63ddba0254e4b9a80197196dea8b7f4a73693ba4602ebfdf4'
            '75901ff1aeae200b7df9e24c94d720a420975aab230f6b87e39947dc54ac5e95')
build() {
    cd "${srcdir}/${pkgname%-player}-${pkgver}"
    npm install
    npm update
    sed 's|"AppImage",|"AppImage"|g' -i package.json
    sed '157,160d' -i package.json
    npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-player}-${pkgver}/release/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-player}-${pkgver}/packages/app/resources/media/1024x1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "Nuclear Player" --exec "/opt/${pkgname}/${pkgname%-player} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}