# Maintainer: Henil <henil2911 + aur at gmail <.> com>
pkgname=zellij-git
_pkgname=zellij
pkgver=r554.d89e3e9
_pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A terminal workspace with batteries included"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/zellij-org/zellij"
license=('MIT')
groups=()
depends=()
makedepends=('rustup' 'cargo' 'git' 'binaryen')
checkdepends=()
optdepends=()
provides=('zellij')
conflicts=('zellij')
options=()
source=("git+https://github.com/zellij-org/zellij")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    cargo install --force cargo-make
    cargo make install ./zellij
    mkdir -p assets/completions
    ./zellij generate-completion bash > assets/completions/zellij.bash
    ./zellij generate-completion fish > assets/completions/zellij.fish
    ./zellij generate-completion zsh > assets/completions/_zellij
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/share/doc/zellij"
    install -Dm755 ./zellij "${pkgdir}/usr/bin/zellij"
    install -Dm644 GOVERNANCE.md "${pkgdir}/usr/share/doc/zellij/GOVERNANCE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/zellij/README.md"
    install -Dm644 assets/completions/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij.bash"
    install -Dm644 assets/completions/zellij.fish "${pkgdir}/usr/share/fish/completions/zellij.fish"
    install -Dm644 assets/completions/_zellij "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
