# Maintainer: czyt <czytcn@gmail.com>
pkgname=mise-bin
pkgver=2026.9.11
pkgrel=1
pkgdesc="dev tools, env vars, task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/jdx/mise"
license=('MIT')
options=('!debug')
optdepends=(
    'bash-completion: bash completion support'
    'fish: fish completion and automatic environment activation'
    'zsh: zsh completion support'
)
provides=('mise')
conflicts=('mise' 'mise-musl-bin' 'rtx')
replaces=('rtx')
source_x86_64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-x64.tar.xz")
source_aarch64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-arm64.tar.xz")
sha256sums_x86_64=('aec93997952d33a28e4317a4a84cdc473a14361b809c0a2e681811bac2c7d174')
sha256sums_aarch64=('2225f1c443b74cb92098245f62673df9e8dfc1cd8cd66d3921d72f9496963ef5')

package() {
    install -Dm755 "${srcdir}/mise/bin/mise" "${pkgdir}/usr/bin/mise"

    # disable mise self-update (managed by pacman)
    install -Dm644 /dev/null "${pkgdir}/usr/lib/mise/.disable-self-update"

    # man page
    install -Dm644 "${srcdir}/mise/man/man1/mise.1" "${pkgdir}/usr/share/man/man1/mise.1"

    # fish automatically loads both vendor completions and vendor conf files.
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/mise/bin/mise" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/mise.fish"
    install -Dm644 "${srcdir}/mise/share/fish/vendor_conf.d/mise-activate.fish" "${pkgdir}/usr/share/fish/vendor_conf.d/mise-activate.fish"

    # Generate bash and zsh completions from the same versioned binary.
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    "${srcdir}/mise/bin/mise" completion bash > "${pkgdir}/usr/share/bash-completion/completions/mise"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    "${srcdir}/mise/bin/mise" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_mise"

    # license
    install -Dm644 "${srcdir}/mise/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # docs
    install -Dm644 "${srcdir}/mise/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
