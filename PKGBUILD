# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=localchat-bin
_pkgname=LocalChat
pkgver=0.11.0
_electronversion=28
pkgrel=4
pkgdesc="Chat with generative language models locally on your computer with zero setup.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://nathanlesage.github.io/local-chat/"
_ghurl="https://github.com/nathanlesage/local-chat"
license=("GPL-3.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'vulkan-icd-loader'
)
optdepends=(
    'cuda'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('85d2bf290e176f37eb06adbc72909174764582dc6479ff04338b00708009ccd7')
sha256sums_x86_64=('ae535128e62c8871c9fa17cc4318a2394d1dd53a4f470cfd44b10da4c548974a')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/.webpack/main/native_modules/llamaBins/"{linux-armv7l,mac-*,win-*}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar"  -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}