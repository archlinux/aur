# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=3.9.2
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
sha256sums_aarch64=('1f92dc5b0c9adef1c423298a3ead843faa92f507fc4244f4a95464a62e8fed1f')
sha256sums_x86_64=('cdb339d5cc71edd1683f0c60a98d987b3cced062b5b8ea460951d978e68785ec')
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
