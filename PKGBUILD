# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=phoenix
pkgname="dragonrealms-${_appname}-bin"
_pkgname='Phoenix'
pkgver=1.35.0
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
sha256sums=('be16725c87f8b3e3adfb93024ac385121ab103a57114266f35392246668f1e67'
            '9840c7e4ab122a58a44c4a988d289c6f630c95ad10b7887452e3b326332a0bc3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/RolePlaying/RolePlaying;Game/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/opt/${_pkgname}/resources/app"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app,app.asar.unpacked} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}