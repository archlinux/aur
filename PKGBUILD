# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.12.6
pkgrel=8
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
)
makedenpends=(
    'gendesk'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux64.zip")
source=("${pkgname%-bin}.sh")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
sha256sums=('87aad073913a72e5fa1c7f4e0f6f695dafc5ba8ea675a62be03c532c701c243a')
sha256sums_i686=('b8c3bcd2decfa84c2b73e93146c66902448dd77812b6b209559f8f194827d697')
sha256sums_x86_64=('1d3b117ee364137d1c85ac299969a0484eb7761f3f2496dd654ae338acb37b24')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    find "${srcdir}/opt/${pkgname%-bin}" -type f -exec chmod -R a+r {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/credits.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}