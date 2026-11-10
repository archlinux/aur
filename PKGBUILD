# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=3.9.1
pkgrel=1
pkgdesc='A mock code autogenerator for golang.'
arch=(
    'aarch64'
    'x86_64'
)
url="https://vektra.github.io/mockery/"
_ghurl='https://github.com/vektra/mockery'
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "golang-${pkgname%-bin}"
)
optdepends=(
    'zsh: for zsh completion'
    'fish: for fish completion'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('0b7a9f1fe2c223b89d1ee3975a64e81c1ef3fc34dbc1fbd28f672f77c3681125')
sha256sums_x86_64=('498b459515c463080df83735792b620c335f027c8b4c0e666d4de98156f0ea68')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    local -A completions=(
        [bash]="/usr/share/bash-completion/completions/${pkgname%-bin}"
        [fish]="/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
        [zsh]="/usr/share/zsh/site-functions/_${pkgname%-bin}"
    )
    for shell in "${!completions[@]}"; do
        if [[ "$shell" == "bash" ]] || command -v "$shell" &>/dev/null; then
            "${srcdir}/${pkgname%-bin}" completion "$shell" > "${srcdir}/${pkgname%-bin}.$shell"
            install -Dm644 "${srcdir}/${pkgname%-bin}.$shell" "${pkgdir}${completions[$shell]}"
        fi
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
