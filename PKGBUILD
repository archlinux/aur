# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=butterfly
pkgname="linwood-${_pkgname}-bin"
_appname="dev.linwood.${_pkgname}"
pkgver=2.3.3
pkgrel=1
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://docs.butterfly.linwood.dev/"
_ghurl="https://github.com/LinwoodDev/Butterfly"
license=(
    'AGPL-3.0-only'
    'CC-BY-4.0'
    'Apache-2.0'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'at-spi2-core'
    'libsecret'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/LinwoodDev/Butterfly/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64.rpm")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('d3de12d51953bd636926e476c146d3fc87d6bc0ef021f5bcdf73195d57189932')
sha256sums_x86_64=('f27fa379d4aa634dee1e808f2c9c04db1f7c84612eb986dee410f774c7308e80')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/usr\/share\/${pkgname%-bin}\/data\/flutter_assets\/images\/logo.svg/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/data/flutter_assets/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
