# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
pkgname=electron-fiddle-bin
_pkgname="Electron Fiddle"
pkgver=0.38.0
_electronversion=40
pkgrel=1
pkgdesc=":electron: 🚀 The easiest way to get started with Electron.(Prebuilt version.Use system-wide electron)"
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://electronjs.org/fiddle"
_ghurl="https://github.com/electron/fiddle/"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	"electron${_electronversion}"
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.armv7hl.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('a6491c6df12a1712712a02d540314593347f360c28cf656ecfc5699f7266c994')
sha256sums_armv7h=('4cbf729f9151bee4b0c768b08d08e6efd3bebc89b54e4638c6eca06891a2efe5')
sha256sums_x86_64=('5a155866a57b780426c5e61a83ec5e1139dd5d4b3415ca1173ec95ad555454f4')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
