# Maintainer: Henil <henil2911 + aur at gmail <.> com>
pkgname=zellij-git
_pkgname=zellij
pkgver=r2207.17205793
_pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A terminal workspace with batteries included"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/zellij-org/zellij"
license=('MIT')
groups=()
depends=()
makedepends=('rustup' 'cargo' 'git' 'binaryen' 'mandown')
checkdepends=()
optdepends=()
provides=('zellij')
conflicts=('zellij')
options=()
source=("git+https://github.com/zellij-org/zellij")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    cargo install --locked cargo-xtask
    cargo xtask install ./zellij
    mkdir -p assets/completions
    ./zellij setup --generate-completion bash > assets/completions/zellij.bash
    ./zellij setup --generate-completion fish > assets/completions/zellij.fish
    ./zellij setup --generate-completion zsh > assets/completions/_zellij
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/share/doc/zellij"
    install -Dm755 ./zellij "${pkgdir}/usr/bin/zellij"
    install -Dm644 GOVERNANCE.md "${pkgdir}/usr/share/doc/zellij/GOVERNANCE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/zellij/README.md"
    install -Dm644 assets/man/zellij.1 "${pkgdir}/usr/share/man/man1/zellij.1"
    install -Dm644 assets/completions/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
    install -Dm644 assets/completions/zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
    install -Dm644 assets/completions/_zellij "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
