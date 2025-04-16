# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=antares
pkgname="${_pkgname}-sql-beta-bin"
_appname=Antares
_pkgver=0.7.35
_betaver=beta.0
pkgver="${_pkgver}_${_betaver}"
_electronversion=30
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX.(Prebuilt Beta version.Use system-wide electron)"
arch=(
    #'aarch64'
    'armv7h'
    'x86_64'
)
url="https://antares-sql.app/"
_ghurl="https://github.com/antares-sql/antares"
license=('MIT')
provides=("${pkgname%-beta-bin}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-beta-bin}"
)
depends=(
    "electron${_electronversion}"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}-linux_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/antares-sql/antares/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_armv7h=('d90df2f3fd480879b267a3ab440fe450d71fc8394862ebaf2a13f824e4466d5a')
sha256sums_x86_64=('048c6c342dd0f6d82d1d8a33ab9f7a09cd7ace08749dfb63086658c231b6b2b5')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}