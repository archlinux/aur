# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glyphr-studio-desktop-bin
_pkgname="Glyphr Studio"
pkgver=0.6.0
_electronversion=28
pkgrel=5
pkgdesc="A desktop client for Glyphr Studio built in electron.Glyphr Studio is a free, web based font designer."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-Desktop"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
provides=("${pkgname%-desktop-bin}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-desktop-bin}"
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('c03fd74001e41c656a646788556ff9ceb9d97a44eac8ead5baa09f61f3d6e217')
sha256sums_x86_64=('b156bd22d1864c71ddb5063c17f405d1340760207cf15973082e6d072e55c317')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}