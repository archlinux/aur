# Maintainer: Levi Zim <rsworktech at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine
_pkgname=AFFiNE
pkgver=0.18.1
_electronversion=33
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=(
    'LicenseRef-custom'
    'MIT'
)
provides=("${pkgname}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "git+https://github.com/toeverything/AFFiNE#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('6e2aa80ab84fdd7edef25c84c38f0a008207cd4b97722567fb0707f70177041a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname}/resources/app.asar.unpacked/dist/${pkgname}.linux-x64-gnu.node" \
        -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/dist"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
