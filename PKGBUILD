# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Braeden Mollot <3mollot at gmail dot com>
_appname=min
pkgname="${_appname}-browser-bin"
_pkgname=Min
pkgver=1.35.2
_electronversion=38
pkgrel=1
pkgdesc="A fast, minimal browser that protects your privacy.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://minbrowser.org/"
_ghurl="https://github.com/minbrowser/min"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('f203db409b7d2bb955b1c90297cccbda6ecd597bfb3937590a8aa82719479f58')
sha256sums_armv7h=('56b040d975aba1565a0388ed1bd7326a333d35594539efe4944c2575e7357754')
sha256sums_x86_64=('f79952bd29b1f053e79187a398f6495d6951e9d7f33df8ce00cd138cabafecc5')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
