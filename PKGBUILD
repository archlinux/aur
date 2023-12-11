# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certbox-bin
pkgver=1.7.2
_electronversion=27
pkgrel=1
pkgdesc="A X.509 certificate toolbox on your desktop or in your browser. It allows you to easily generate entire certificate chains, issue certificates from existing roots, clone certificates, and more."
arch=(
    'aarch64'
    'x86_64'
)
url="https://certbox.io/"
_ghurl="https://github.com/tls-inspector/certbox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_x64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tls-inspector/certbox/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('86a899de0d14686c5fc2a444067323ed7162e88718b9d0b045653383b6059719'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('9b5eec564743883ec9fb82de9b1137764e9591771db91065f3dbab4b022a0b25')
sha256sums_x86_64=('9f35c5f4e3d3b5808b6bd2360262c4a282daa56be11262b315ec0d990c40173e')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}