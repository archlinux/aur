# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certbox-bin
pkgver=1.8.1
_electronversion=30
pkgrel=2
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
sha256sums=('6b2fa2b36ced9533ff04ff21bd9c7d22b4fd1747bcdc8a840f009943a51b628e'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('da9e18f9f965896f9c220f09556cc06d74e394602398e859591939d58190fe33')
sha256sums_x86_64=('6ec9cffa9be2b5ebe3b16d2928570c57d4d78fb5da1a68f9e3a44a4bd1de6b32')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}