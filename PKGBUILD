# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cinematic-bin
_pkgname=Cinematic
pkgver=3.1.0
_electronversion=27
pkgrel=2
pkgdesc="Gorgeous desktop movie collections.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://gh.lacymorrow.com/cinematic/"
_ghurl="https://github.com/lacymorrow/cinematic"
license=('CC-BY-NC-SA-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lacymorrow/cinematic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e1514d056a6963f91108ab623f36b0eab4fe1698de91568bf292f72528b074cd'
            'e66c269d4819aaab34b49ef5220c4ddab6756f21bb5180761a4eb8561f2b7bbd'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname%-bin}/
        s/@options@//
    " "${srcdir}/${pkgname%-bin}.sh"
    sed "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/;s/Video/AudioVideo/" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}