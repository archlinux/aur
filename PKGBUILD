# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onlook-bin
_appname="@${pkgname%-bin}studio"
_pkgname=Onlook
pkgver=0.0.57
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="The open source, local-first Webflow alternative. Design directly in your live React site and publish your changes to code.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://onlook.dev/"
_ghurl="https://github.com/onlook-dev/studio"
license=("Apache-2.0")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-amd64.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('fc77950bf88b07101f62fd005784957e77414f8300b1e5d63b598aeb827f833a')
sha256sums_x86_64=('9ee060fd33ec4edda1b83975ace26d917476b82d5231a6cb5b864e68f045d948')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\"\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1200x1200/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
