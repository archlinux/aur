# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=story-writer-bin
_pkgname=Story-writer
pkgver=8.13.0
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
sha256sums_i686=('b5f7580f4b219e02e653177a7c396ebf1e7fa45001e0ffe148531f071ec5742a')
sha256sums_x86_64=('242eb853c75168938539fd110ae07a865b9f1a64653a5894e1985728c0e25da4')
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