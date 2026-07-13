# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixes-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Unofficial pixiv app.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/wgh136/pixes"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wgh136/pixes/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('5aaabbeafa067d045963cfc2d8d0fed63c41d0e20267771b1b8501a350d3b3f5'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('0babf114548e15a76a01a6f263316737b79bf214c5f8d0c5db2b897fd1507216')
sha256sums_x86_64=('916b819a18c664fb4991b049b06c326876b8047fa528b5f5f0c27b9f932c1e5e')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/local\/lib\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/usr/local/lib/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
