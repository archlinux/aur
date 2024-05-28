# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.4.2
pkgrel=2
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://git.sr.ht/~mzhang/garbage'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('cargo')
source=("https://git.sr.ht/~mzhang/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c4b2c671f259b3091e0f86f58629cc655893c5f3f8e8f1d18845213e1eefc0df')

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin

    mkdir -p \
      "${pkgdir}/usr/share/bash-completion/completions" \
      "${pkgdir}/usr/share/fish/vendor_completions.d" \
      "${pkgdir}/usr/share/zsh/site-functions"

    "${pkgdir}/usr/bin/${pkgname}" generate-completions bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    "${pkgdir}/usr/bin/${pkgname}" generate-completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    "${pkgdir}/usr/bin/${pkgname}" generate-completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
