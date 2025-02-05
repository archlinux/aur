# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.14.0
pkgrel=1
pkgdesc="A very excellent knowledge management software.小书匠是一款非常优秀的知识管理软件."
arch=(
    'i686'
    'x86_64'
)
url="http://soft.xiaoshujiang.com/"
_ghurl="https://github.com/suziwen/markdownxiaoshujiang"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'nss'
    'alsa-lib'
    'libxfixes'
    'libxrandr'
    'nodejs'
    'libdrm'
    'libxdamage'
    'pango'
    'libxcomposite'
    'at-spi2-core'
    'mesa'
    'libxkbcommon'
    'libcups'
)
makedenpends=(
    'gendesk'
)
options=(
    '!strip'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux64.zip")
source=("${pkgname%-bin}.sh")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
sha256sums=('39a52bd55470c5bdbc9bcdb2d801d61aacb374093a77c0435a13dd8291ab3811')
sha256sums_i686=('944633a2effed03ab859eb9a8d1aa3cf61bed9a7dddee0aad991fd5c6e72ffce')
sha256sums_x86_64=('dad2b952652e0e7d79d2726ebed5dbf7780a08f5315a6800aa76ac4a2801acf0')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/"{"${_pkgname}",chrome_crashpad_handler}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}