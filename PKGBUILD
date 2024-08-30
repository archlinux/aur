# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.13.2
pkgrel=2
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
sha256sums=('3796d169f0e15d1a99d09c2cd4924f6b4840ef445babf697ceeb87a8a9679d77')
sha256sums_i686=('a79fd7feb015682460a591096086c614ea827d528836d9a31f2ed24caa3c0b62')
sha256sums_x86_64=('f1dc90f979d844f825dc11b0647e74d4c5a844ebe5177dd7d7d230c8bf964323')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/"{"${_pkgname}",chrome_crashpad_handler}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}