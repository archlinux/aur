# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youtube-transcript-fetcher-bin
_appname=transcripts
_pkgname='Youtube Transcript Fetcher'
pkgver=1.0.0
_electronversion=35
pkgrel=1
pkgdesc="A simple Electron app to fetch and save Youtube transcripts.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Zyztem/Youtube-Transcript-Fetcher"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Zyztem/Youtube-Transcript-Fetcher/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2e99076db96206d25946c1d3d3811772b6a8bc37b1a3b333ab88603ee9900264'
            'f3d628a4ec5ed150807f81ebac4504a40f30a47b16158742f57a5b1ba248cb95'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}