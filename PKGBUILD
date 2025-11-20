# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flawless-cut-bin
pkgver=1.1.0
_electronversion=23
pkgrel=2
pkgdesc="Fast and lossless video cutter and merger based on Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/metadream/app-flawless-cut"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libmediainfo'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/metadream/app-flawless-cut/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
    )
sha256sums=('28debe0ea79488000337f8da5d12cad51ce9e965dfff9dc63da031d28c38d328'
            'f3eac6adfa3dd9332b033a4aa8f565d05947b371fa729ceb6712a0123c5dcc46'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
