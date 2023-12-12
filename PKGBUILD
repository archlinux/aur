# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixelviewer-bin
_pkgname=PixelViewer
pkgver=2.7.4.312
pkgrel=4
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
    'gcc-libs'
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
            'cd87dcfa438cbda7cee315933d5c260629bbe09ac6201b8bf37993c8ab1610cc')
sha256sums_aarch64=('92bfb0c33f2cf808ef56ebff1a5255613122c15ff6ad6097d91a16214f61317f')
sha256sums_x86_64=('55ca0c80d5adfb9a0b9661622c789b84646f3e3875faad6b8f61f17bca9380ab')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Graphics;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/"*.* -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}/"{createdump,"${_pkgname}"} -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}