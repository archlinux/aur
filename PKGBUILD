# Maintainer: pati <49492351+EmojiPati@users.noreply.github.com>

pkgname=omp-bin
pkgver=16.2.11
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
conflicts=('oh-my-pi' 'omp')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
source_x86_64=("omp-${pkgver}-x86_64::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64")
source_aarch64=("omp-${pkgver}-aarch64::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-arm64")
sha256sums=('545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')
sha256sums_x86_64=('387eb20fa29a7f526f93a51ec984e56a0b45b46774499c81aa286029e815f398')
sha256sums_aarch64=('f8a7e52c58a398473446626536a5f8e7bf6bb65072351f977539458c54e1da9e')

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
