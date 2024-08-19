# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-bin
_pkgname="Podman Desktop Companion"
pkgver=5.2.0_rc.3
_electronversion=31
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
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('765bcb62c7def22ec8ce37083f088b89f691e00fd055b931b5d5465fbcd871d2')
sha256sums_x86_64=('010d01e146fef21b09bc38cf3e0a952ec9d359a5029e193435e640d3dd21592a')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"{app.asar.unpacked,support} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}