# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
_pkgname=Wave
pkgver=0.11.3
_electronversion=34
pkgrel=1
pkgdesc='An open-source, cross-platform terminal for seamless workflows.(Prebuilt version.Use system-wide electron)'
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
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.pacman")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('e381c7d8f7d9bfca66c05ea43769d715bfab8af1d1a5ede279ae4af2218d410a')
sha256sums_x86_64=('859454e206a76d5198bf320ff6fe173662a563f665393ea19227f97e25247521')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/TerminalEmulator/TerminalEmulator;Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/dist/bin/"{*-darwin.*,*-linux.mips*,*-linux-x64,*-windows.*}
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/dist/bin/"{*-darwin.*,*-linux.arm64,*-linux.mips*,*-windows.*}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}