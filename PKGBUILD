# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixelviewer-bin
_pkgname=PixelViewer
pkgver=2026.1.4
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
            'f96446b452c48cb8b0306c4f999ab6729927c8b3a27f2355abbb484e3e63cf6f')
sha256sums_aarch64=('8135f8d398784be4795002174e6075f7c9310d250f223394ad8a077713227853')
sha256sums_x86_64=('1015d96315b2aecd5f14abf4898c1a2952d8d15f2c8a25cca8a126e0cd268d51')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n  \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/__MACOSX"
    find "${srcdir}/usr/lib/${pkgname%-bin}/" -type d -exec chmod 755 {} +
    find "${srcdir}/usr/lib/${pkgname%-bin}/" -type f -exec chmod 644 {} +
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/"{createdump,"${_pkgname}"}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
