# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato
_appname=teams-for-linux
pkgname="${_appname}-electron-bin"
pkgver=1.13.2
_electronversion=34
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client.(Prebuilt version.Use system-wide electron)"
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${_appname}"
	"${_appname}-wayland-hook"
	"${_appname}-git"
	"${_appname}-bin"
	"${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.x86_64.rpm")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('1e7a89d4fc341200d72d9a1c6c8e571128ec0cedfe2f1c9fa7fa95b137ed4c46')
sha256sums_armv7h=('169779017d0d3d7f9638018f11aff21c5b1daec9b8f50d80877e43bd44fd45f1')
sha256sums_x86_64=('ef3205227e2cd57283ec97420e1c61d67cc53e14676b5208d476c1677c5a6d0b')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/assets" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}