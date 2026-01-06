# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=amethyst
pkgname="${_pkgname}-player-bin"
_appname=Amethyst
pkgver=2.1.8
_electronversion=36
pkgrel=1
pkgdesc="A cross-platform music player made with Typescript.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://amethyst.pages.dev/"
_ghurl="https://github.com/Geoxor/Amethyst"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-numpy'
    'python-yaml'
    'python-setuptools'
    'python-tqdm'
    'perl'
    'libvips'
    'libpulse'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Geoxor/Amethyst/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2f892795f62b8f7bef478575fae01c686a673766689d3b50958f8acfddacb510'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('daae13c5038a53ef3fecf4e053e603cc09d8606ca2fd8c422c045753a25121fe')
sha256sums_x86_64=('68a5e6b29e66eaf69205b6ebfbebb7780ef58d081b25539f6f3dece026a511ef')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_appname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Music;/AudioVideo;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/opt/${_appname}/resources/app.asar.unpacked/node_modules/@biomejs/cli-linux-x64-musl"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
