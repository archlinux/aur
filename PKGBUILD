# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.4.0
pkgrel=1
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://git.sr.ht/~mzhang/garbage'
arch=('any')
license=('GPL3')
makedepends=('cargo')
source=("https://git.sr.ht/~mzhang/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c98e2769d88f1a85fbcbf4b08a2972acdf29079344ef9323aeace0788be635c9')

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
