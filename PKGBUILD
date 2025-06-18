# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=affine
pkgname="${_appname}-canary-bin"
_pkgname=AFFiNE-canary
_pkgver=0.23.0
_subver=canary.1
pkgver="${_pkgver}_${_subver}"
_electronversion=36
pkgrel=1
pkgdesc="A next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.(Test Version,use system-wide electron)"
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=(
    'MIT'
    'LicenseRef-custom'
)
provides=("${_appname}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${_pkgver}-${_subver}/${_appname}-${pkgver//_/-}-canary-linux-x64.deb"
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${_pkgver}-${_subver}/LICENSE-MIT"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${_pkgver}-${_subver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f88934357216907aaf885f40db6d6a6ed1b03b7eb53920ac208625b554b623cb'
            '1cdeca52d4f740361f103926144eb8b3f265975b2337d4e27b3313f72465897f'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/dist/${_appname}.linux-x64-gnu.node" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/dist"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}