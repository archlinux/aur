# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixelviewer-bin
_pkgname=PixelViewer
pkgver=3.0.5.214
pkgrel=2
pkgdesc="A cross-platform image viewer which supports reading raw Luminance/YUV/RGB/ARGB/Bayer pixels data from file and rendering it."
arch=(
    'aarch64'
    'x86_64'
)
url="https://carina-studio.github.io/PixelViewer/"
_ghurl="https://github.com/carina-studio/PixelViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'fontconfig'
)
makedepends=(
    'gendesk'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/carina-studio/PixelViewer/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('4b023d792eb6b929311286a207c6493e18875bd9d320db8f7a996dd5d5716fea'
            '259d55437eac40590c6174afa8a3e93ba47e4e4ecb9daad55e07bd5149c56588')
sha256sums_aarch64=('300682e7d37195868f2a2f8d5cc6a1f5fd44799103a68d5d8430c6868f65f806')
sha256sums_x86_64=('d44ce2a2af25b5cbb3686fe4f852eecf4527638629b711ae35c8e52c67aa88de')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Graphics" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    chmod 644 "${srcdir}/opt/${pkgname%-bin}/"*
    chmod 755 "${srcdir}/opt/${pkgname%-bin}/"{createdump,"${_pkgname}"}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}