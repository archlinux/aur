# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=container-desktop-bin
_pkgname="Container Desktop"
pkgver=5.2.2_rc.7
_electronversion=32
pkgrel=1
pkgdesc="Podman desktop companion.A familiar desktop graphical interface to the free and open container manager, podman!"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iongion/container-desktop/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-aarch64-${pkgver//_/-}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-x64-${pkgver//_/-}.pacman")
sha256sums=('fd5805079cad1ee5ebcfd2a2a58e16553314c51700ce5f4e32dba06d9ce49283'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('f985ed038ec97dc8c5383745402a20bf9bf7ede64c5a270f211f483af329fe0c')
sha256sums_x86_64=('1ef5337b2c8ba61334b86271c5f0c965dbbd80b2e8aa8c46c4cb721072628ccf')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname%-bin}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/support" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}