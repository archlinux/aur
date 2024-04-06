# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stealthplane-bin
_pkgname=StealthPlane
pkgver=1.1.0
_electronversion=29
pkgrel=1
pkgdesc="A floating web browser app designed to stay on top of other windows for seamless multitasking."
arch=("x86_64")
url="https://github.com/mahdi991613487/StealthPlane"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
    #'!staticlibs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "License-${pkgver}.txt::https://raw.githubusercontent.com/mahdi991613487/StealthPlane/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('afb46b0ec2ecc4b0f00ad6fab9199b1478e51974f711cd5ddcf2b743cc869a4d'
            '738958cc40fe219a82ef6b340c356dd696327904c72aaaffc25858124a5f96fc'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 32 64 128 512 1024 2048;do
        install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/src/assets/${_pkgname}${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/src/assets/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}