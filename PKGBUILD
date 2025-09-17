# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyrically-bin
_pkgname=Lyrically
pkgver=0.7.0
_electronversion=30
pkgrel=1
pkgdesc="Music player inspired by Lyric Speaker.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/CyanSalt/lyrically"
license=('ISC')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/resources/images/icon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c379a0625ed7e1ef8c867af8b57049bbe7a5616b6d4702257e339505e6761779'
            'c74748ff891e15f7295841ef76d2b8aee5fbc296652b72fb948f274d89fa3fae'
            '9950b2ef9948d119f67c09e78478be5c96db2028bebf735ee60a9e3c5afe0bc0'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_pkgname}-linux-x64/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
