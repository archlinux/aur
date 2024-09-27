# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
_pkgname=Wave
pkgver=0.8.6
_electronversion=32
pkgrel=1
pkgdesc='An open-source, cross-platform terminal for seamless workflows.Use system-wide electron.'
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.waveterm.dev"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache-2.0')
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.pacman")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('3375a6408d2206ce8cd5cb3dfacadbd5e54b3f9c9fa4ce34fc28a24ef59fa079')
sha256sums_x86_64=('9bcf5d6bb087e98a39cbb3c7fd03ac317cf2b745b65b5beeedd799b3d4c92084')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g;s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g;s/TerminalEmulator/TerminalEmulator;Utility/g" \
        "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}