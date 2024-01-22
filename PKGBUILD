# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-bin
_pkgname="Podman Desktop Companion"
pkgver=4.1.0_rc.28
_electronversion=18
pkgrel=6
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=(
    "aarch64"
    "x86_64"
)
url="https://iongion.github.io/podman-desktop-companion/"
_ghurl="https://github.com/iongion/podman-desktop-companion"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    'hicolor-icon-theme'
    'at-spi2-core'
    'gtk3'
    'alsa-lib'
    'nss'
    'nspr'
    'podman'
    'docker'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-arm64-${pkgver//_/-}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-amd64-${pkgver//_/-}.deb")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/iongion/podman-desktop-companion/${pkgver//_/-}/LICENSE")
sha256sums=('1a33f39c0fb06d0bf3bc82dbb2ca621ebd225158dd9a73557f7f583a9d61ece6')
sha256sums_aarch64=('5e506578978e843362ebfdd6b27778a65491264599e442e246784e570ea9d392')
sha256sums_x86_64=('7801f0c01c402807bba07dc9ca7d559b0181d05a8049a33a776c55a44eed2c38')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}