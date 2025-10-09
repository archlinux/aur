# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dopamine-bin
_pkgname=Dopamine
pkgver=3.0.0_preview.40
_electronversion=26
pkgrel=1
pkgdesc="The audio player that keeps it simple.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/digimezzo/dopamine"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('5d45fb5d08b46f522aee99e6bc18b06e9cf06ca20a3210950be5b04a815603b8'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Audio;/AudioVideo;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    unlink "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/register-scheme/build/node_gyp_bins/python3"
    ln -sf "/usr/bin/python" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/register-scheme/build/node_gyp_bins/python3"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
