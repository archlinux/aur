# Maintainer: enos muthiani @lyznne <emuthiani26@gmail.com>
pkgname=peek-cli
project=peek
pkgver=0.1.13
pkgrel=1
pkgdesc="A simple file viewer that opens files in the default web browser."
arch=('x86_64')
url="https://github.com/lyznne/${project}"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyznne/${project}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6051f3e6a379628024a0b2b976b609c2ea6a40f4d63422bc1bd441c76f85843c')



build() {
    cd "${srcdir}/${project}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "${srcdir}/${project}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${project}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install shell completions
    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
