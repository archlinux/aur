# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=claude-squad
pkgver=1.0.16
pkgrel=1
pkgdesc='Manage multiple AI terminal agents like Claude Code, Aider, Codex, OpenCode and Amp'
arch=('x86_64' 'aarch64')
url='https://github.com/smtg-ai/claude-squad'
license=('AGPL-3.0-or-later')
depends=('tmux' 'git')
makedepends=('go')
provides=('claude-squad')
conflicts=('claude-squad-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f663667a65dd4e456e49caa67f6998feab4ad56c804ecea024af90afd899084c')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags="-w -s" -o claude-squad .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 claude-squad "${pkgdir}/usr/bin/claude-squad"
    ln -s /usr/bin/claude-squad "${pkgdir}/usr/bin/cs"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    ./claude-squad completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/claude-squad"
    ./claude-squad completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_claude-squad"
    ./claude-squad completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/claude-squad.fish"
}
