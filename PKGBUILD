# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kando-bin
_pkgname=Kando
pkgver=1.8.0
_electronversion=31
pkgrel=1
pkgdesc="A pie menu for the desktop. It will be highly customizable and will allow you to create your own menus and actions.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://ko-fi.com/post/Introducing-Ken-Do-L3L7L0FQ2"
_ghurl="https://github.com/kando-menu/kando"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'xdg-utils'
)
optdepends=(
    'kde-cli-tools'
    'gnome-browser-connector'
    'trash-cli'
    'gvfs'
    'alsa-lib'
    'pulseaudio'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kando-menu/kando/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('fd6cb731b549de5452efacb0833cda7a328eb5263537d29ca18de9d7938f7bab'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('756e03ce4ba724c39f9a7f96edacb7bc88165a030d07e8edb641a31e526ddcb5')
sha256sums_x86_64=('c3fc731d4c6ef82755fb6b54b9c4229251b26153f587f156a884d33cb790e338')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}