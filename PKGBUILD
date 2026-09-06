# Maintainer: pati <49492351+EmojiPati@users.noreply.github.com>

pkgname=omp-bin
pkgver=18.1.12
pkgrel=1
pkgdesc="oh-my-pi (omp): AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (release binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('glibc')
optdepends=('bash-completion: bash tab-completion for omp'
            'chromium: browser tool (headless web automation)'
            'python: persistent Python eval cells')
provides=("oh-my-pi=$pkgver")
conflicts=('oh-my-pi' 'oh-my-pi-bin' 'omp')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
source_x86_64=("omp-${pkgver}-x86_64::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64")
source_aarch64=("omp-${pkgver}-aarch64::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-arm64")
sha256sums=('16c45f9d667442781f03fa198914cc39abcaa48ec5ed8f644643e554ca2fbf63')
sha256sums_x86_64=('f5431008f71d2f3971617205cfce9cb227c1d135665930088244c76d86b2fb42')
sha256sums_aarch64=('128c79498e5b9d3285d57b7b43d46139aad5473a698767314ffbe60c7c5de314')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/omp"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Generate shell completions from the live CLI metadata.
    # The Bun single-file binary needs a writable HOME for its extraction cache.
    local _omp="${pkgdir}/usr/bin/omp"
    export HOME="${srcdir}/.omp-home"
    install -dm755 "${HOME}"

    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    "${_omp}" completions bash > "${pkgdir}/usr/share/bash-completion/completions/omp" 2>/dev/null \
        || rm -f "${pkgdir}/usr/share/bash-completion/completions/omp"

    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    "${_omp}" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_omp" 2>/dev/null \
        || rm -f "${pkgdir}/usr/share/zsh/site-functions/_omp"

    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${_omp}" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish" 2>/dev/null \
        || rm -f "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
}
