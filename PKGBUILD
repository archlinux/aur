# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=1.3.2
_date=2024-10-28
_electronversion=27
pkgrel=1
pkgdesc="2^x Image Super-Resolution.Prebuilt version.Use system-wide electron."
arch=('x86_64')
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
url="https://final2x.tohru.top/"
_ghurl="https://github.com/Tohrusky/Final2x"
depends=(
    "electron${_electronversion}"
    'python>=3.8'
    'nodejs'
    'openssl-1.1'
    'libice'
    'libbsd'
    'libsm'
    'vulkan-icd-loader'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${_date}/${_pkgname}-ubuntu-x64-deb.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Tohrusky/Final2x/${_date}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('35cc4efe2f83444a0b146b4f423a9e458e9d3b4357032e59c6649d5a9817a40a'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
