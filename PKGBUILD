# Maintainer: czyt <czytcn@gmail.com>
pkgname=mise-musl-bin
pkgver=2026.10.9
pkgrel=1
pkgdesc="Portable musl build of mise: dev tools, env vars, task runner"
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
conflicts=('mise' 'mise-bin' 'rtx')
replaces=('rtx')
source_x86_64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-x64-musl.tar.xz")
source_aarch64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-arm64-musl.tar.xz")
sha256sums_x86_64=('02125333078ee2b64fa9011229ee07ca8e1e5949d406ad7c4829f100b5641be4')
sha256sums_aarch64=('9d81a48ab67720baf7b9f6b182598452647ccb969f69a438f3982f541b5eb917')

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
