# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ralphex-bin
pkgver=0.24.2
pkgrel=1
pkgdesc="CLI tool that orchestrates Claude Code to execute implementation plans autonomously"
arch=('x86_64' 'aarch64')
url="https://ralphex.com"
license=('MIT')
depends=('git')
optdepends=(
    'fzf: interactive plan selection'
    'ripgrep: used by review agents'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/umputun/ralphex/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/umputun/ralphex/releases/download/v${pkgver}/ralphex_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/umputun/ralphex/releases/download/v${pkgver}/ralphex_${pkgver}_linux_arm64.tar.gz")
sha256sums=('155d97114b2d9b7f66181d0ba258aca57f97b8b957dd1662745bf57218c41ef3')
sha256sums_x86_64=('6dd5de269042d94ef43ebab16975755014358733e5772a35b142a247f0bc41ed')
sha256sums_aarch64=('a0e25d5375aaeff41a3fd4ee3e0f772962051872b2086fcdaa6b2930b6eff61c')

latestver() {
    curl -fsSL 'https://api.github.com/repos/umputun/ralphex/releases/latest' | jq -r 'select(any(.assets[]?; .name | test("^ralphex_[0-9.]+_linux_amd64\\.tar\\.gz$")) and any(.assets[]?; .name | test("^ralphex_[0-9.]+_linux_arm64\\.tar\\.gz$"))) | .tag_name' |
    sed -E 's/^v//'
}

package() {
    install -Dm755 ralphex "${pkgdir}/usr/bin/ralphex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/ralphex.bash "${pkgdir}/usr/share/bash-completion/completions/ralphex"
    install -Dm644 completions/ralphex.zsh "${pkgdir}/usr/share/zsh/site-functions/_ralphex"
    install -Dm644 completions/ralphex.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ralphex.fish"
}
