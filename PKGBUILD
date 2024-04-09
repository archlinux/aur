# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.13.2
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
sha256sums=('7d80c20ecbd2ef4fdbe18493d26303a28bfbdecb23e722282494fbfb5c080073')
sha256sums_i686=('a79fd7feb015682460a591096086c614ea827d528836d9a31f2ed24caa3c0b62')
sha256sums_x86_64=('f1dc90f979d844f825dc11b0647e74d4c5a844ebe5177dd7d7d230c8bf964323')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    find "${srcdir}/opt/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
    chmod 755 "${srcdir}/opt/${pkgname%-bin}/"{"${_pkgname}",chrome_crashpad_handler}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}