# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-bin
_pkgname="Podman Desktop Companion"
pkgver=5.2.2_rc.4
_electronversion=32
pkgrel=1
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=(
    'aarch64'
    'x86_64'
)
url="https://iongion.github.io/podman-desktop-companion/"
_ghurl="https://github.com/iongion/podman-desktop-companion"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'podman'
    'docker'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/iongion/podman-desktop-companion/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-aarch64-${pkgver//_/-}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-x64-${pkgver//_/-}.pacman")
sha256sums=('fd5805079cad1ee5ebcfd2a2a58e16553314c51700ce5f4e32dba06d9ce49283'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('3bd8508d4045fe7a89bd25631ee173eb92126ed63f477651d4d137f643337025')
sha256sums_x86_64=('11a119bbb44fdeb0b35057ec0bd1a4b3da59a92fc12fdaf17388ecce23f85dd0')
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