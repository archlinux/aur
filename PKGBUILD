# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.4.3
pkgrel=1
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://git.sr.ht/~mzhang/garbage'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('cargo')
source=("https://git.sr.ht/~mzhang/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4156116ceeb1608eab206bea5d1b3a60089fef64ba73d47789630e0427daed27')

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
