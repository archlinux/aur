# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=phoenix
pkgname="dragonrealms-${_appname}-bin"
_pkgname='Phoenix'
pkgver=1.32.0
_electronversion=34
pkgrel=1
pkgdesc="Ignite your DragonRealms journey with Phoenix, a cross-platform game client 🔥.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/dragonrealms-phoenix/phoenix"
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libvips'
    'python'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/dragonrealms-phoenix/phoenix/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('18520a24316c3c62759b734aceb2b8fdb1b95e5b32a5371baf5b9414ed696143'
            '33fbc89566bd7345772998a31b7ccc9d07b9630a49ceaf69bf0252f8bc4fdec4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/RolePlaying/RolePlaying;Game/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/opt/${_pkgname}/resources/app"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app,app.asar.unpacked} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}