# Maintainer: czyt <czytcn@gmail.com>
pkgname=mise-bin
pkgver=2026.9.6
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
sha256sums_x86_64=('a2660ff2e270d26e9068e6788f3522815f81632a1347a15a034ec2be0c78850c')
sha256sums_aarch64=('1205bb1a0bc46f3ca360e8757a74309042f2d6213eff6de1d00c88d47dc703da')

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
