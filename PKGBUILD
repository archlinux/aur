# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.7.1
pkgrel=1
pkgdesc="Command line trash bin"
arch=('any')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('fzf')
optdepends=('skim: supports skim as finder')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('e69bd6125445cd07397209e0272a5626a8995ddff3bdd76bba81766478a25a3d')
options=(!strip !lto !debug)

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen

    mkdir -p completions
    ./target/release/conceal completion --shell zsh >completions/_conceal
    ./target/release/conceal completion --shell bash >completions/conceal.bash
    ./target/release/conceal completion --shell fish >completions/conceal.fish
    ./target/release/conceal completion --shell nu >completions/conceal.nu
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 target/release/conceal -t "${pkgdir}/usr/bin"
    install -Dm 644 completions/_conceal -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 completions/conceal.bash "${pkgdir}/usr/share/bash-completion/completions/conceal"
    install -Dm 644 completions/conceal.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 completions/conceal.nu -t "${pkgdir}/usr/share/nushell/vendor/autoload"

    install -Dm 755 target/release/cnc -t "${pkgdir}/usr/bin"

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
