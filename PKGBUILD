# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=iptvnator
pkgname="${_appname}-electron-bin"
_pkgname=IPTVnator
pkgver=0.16.0
_electronversion=27
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more.Use system electron."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://iptvnator.vercel.app/"
_ghurl="https://github.com/4gray/iptvnator"
license=('MIT')
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
depends=(
    "electron${_electronversion}"
    'mpv'
)
source_aarch64=("${_appname}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_arm64.deb")
source_armv7h=("${_appname}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_armv7l.deb")
source_x86_64=("${_appname}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/4gray/iptvnator/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('d353b5934e2d051398e682cb07fb412de57916578ec34bd6d2dbd26169807691')
sha256sums_armv7h=('ec56e06bd047f1d1dab41ac3df491f82a6214d141eda638f2ff254cda304cbfa')
sha256sums_x86_64=('d314e2e83c3a86200d0e9ed070d6c66f3267142a312bf9cfe180b0ccaeadff43')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g;s/Video/AudioVideo/g;s/Icon=${_appname}/Icon=${pkgname%-bin}/g" \
        "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(192x192 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}