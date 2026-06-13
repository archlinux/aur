# Maintainer: Felipe Pires Morandini <felipepiresmorandini@gmail.com>
# https://github.com/felipemorandini/jwt-term

pkgname=jwt-term-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A blazing-fast, secure, and offline-first CLI for inspecting, validating, and manipulating JWTs"
arch=('x86_64' 'aarch64')
url="https://github.com/felipemorandini/jwt-term"
license=('MIT')
provides=('jwt-term')
conflicts=('jwt-term')

source_x86_64=("${url}/releases/download/v${pkgver}/jwt-term-x86_64-unknown-linux-musl.tar.gz"
               "${url}/raw/v${pkgver}/LICENSE")
source_aarch64=("${url}/releases/download/v${pkgver}/jwt-term-aarch64-unknown-linux-musl.tar.gz"
                "${url}/raw/v${pkgver}/LICENSE")

sha256sums_x86_64=('f969004010c12a863ecb610e1cff8c47dc5e332c9aeb562dc8ca3b76d05ad0d4' 'ef8af8e1acd4a78f0cc359dacd727fd7ce494f5590d9d527d4c06ea1e816f0b7')
sha256sums_aarch64=('b466a20e1b5f532e785c24f3bb764a576d261cc0266187f1fa29a1bfd571222f' 'ef8af8e1acd4a78f0cc359dacd727fd7ce494f5590d9d527d4c06ea1e816f0b7')

package() {
    install -Dm755 jwt-term "${pkgdir}/usr/bin/jwt-term"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Generate and install shell completions
    "${srcdir}/jwt-term" completions bash > jwt-term.bash || echo "WARNING: bash completions generation failed"
    "${srcdir}/jwt-term" completions zsh > _jwt-term || echo "WARNING: zsh completions generation failed"
    "${srcdir}/jwt-term" completions fish > jwt-term.fish || echo "WARNING: fish completions generation failed"

    if [ -s jwt-term.bash ]; then
        install -Dm644 jwt-term.bash "${pkgdir}/usr/share/bash-completion/completions/jwt-term"
    fi
    if [ -s _jwt-term ]; then
        install -Dm644 _jwt-term "${pkgdir}/usr/share/zsh/site-functions/_jwt-term"
    fi
    if [ -s jwt-term.fish ]; then
        install -Dm644 jwt-term.fish "${pkgdir}/usr/share/fish/vendor_completions.d/jwt-term.fish"
    fi
}
