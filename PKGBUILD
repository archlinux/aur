# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynxhub-bin
_pkgname=LynxHub
pkgver=1.3.1
_electronversion=33
pkgrel=1
pkgdesc="Manage and launch all your AI from a single dashboard.(Prebuild version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/KindaBrazy/LynxHub"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libsecret'
    'python'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/V${pkgver}/${_pkgname}-V${pkgver}-linux_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/V${pkgver}/${_pkgname}-V${pkgver}-linux_x86_64.rpm")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('d6f04926288301171a7d563bf3be918c8c47a6f053dce784a832e4b3ec9df8cd')
sha256sums_x86_64=('f12ff692bd453f00b9db9471c94ddaccfb1fcf49c02527304dc36039d54b0ab4')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/g
        s/ArtificialIntelligence/ArtificialIntelligence;Utility/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
