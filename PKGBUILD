# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=container-desktop-bin
_pkgname='Container Desktop'
pkgver=5.2.13
_electronversion=33
pkgrel=2
pkgdesc="Podman desktop companion.A familiar desktop graphical interface to the free and open container manager, podman!(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://iongion.github.io/container-desktop/"
_ghurl="https://github.com/iongion/container-desktop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'podman'
    'docker'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iongion/container-desktop/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-x64-${pkgver}.pacman")
sha256sums=('fd5805079cad1ee5ebcfd2a2a58e16553314c51700ce5f4e32dba06d9ce49283'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('7b1ee1acd0587c24c51b73c3c1377350f0dd6efc94c3e0824b981e854c5cb6b4')
sha256sums_x86_64=('0e1df0fff0b94051349b0c1676f80f5a65355dc32e1b57d772a616a8abf0f987')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/support" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
