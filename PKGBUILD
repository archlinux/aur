# Maintainer: pati <49492351+EmojiPati@users.noreply.github.com>

pkgname=omp-bin
pkgver=18.13.3
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
sha256sums_x86_64=('42d39fa8996fed9f999e26306e60e2fdbea0c0de0d0b2d68feba275f44c41d04')
sha256sums_aarch64=('981f08df6c6344356b31aa696fdd810b8b5fa8c8851ba926d3940e793d47cc3a')

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
