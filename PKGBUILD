# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixelviewer-bin
_pkgname=PixelViewer
pkgver=3.1.0.326
pkgrel=1
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
sha256sums_aarch64=('e8e2b31306901962a98dac0dbe6c839da81ca378059353b37e19747616d68863')
sha256sums_x86_64=('0dedcbea5f37a7e39a4de43a737d150563a987a255632a08fd403ada7372433c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Graphics" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/__MACOSX"
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