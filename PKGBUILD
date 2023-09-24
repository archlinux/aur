# Maintainer: David Briggs <david at dpbriggs.ca>
# Adapted from zellij-git https://aur.archlinux.org/packages/zellij-git
pkgname=borgtui-git
_pkgname=borgtui
pkgver=r99.21619f0
_pkgver=0.3.3
pkgrel=1
epoch=
pkgdesc="Like borgmatic, but with a TUI to help automate borg backups :^)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/dpbriggs/borgtui"
license=('GPL3')
groups=()
depends=('borg' 'glibc' 'gcc-libs' 'python-llfuse')
makedepends=('rustup' 'cargo' 'git')
checkdepends=()
optdepends=()
provides=('borgtui')
conflicts=('borgtui')
options=()
source=("git+https://github.com/dpbriggs/borgtui")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    cargo install --path=./ --root=.
    mkdir -p assets/completions
    ./bin/borgtui shell-completion --shell bash > assets/completions/borgtui.bash
    ./bin/borgtui shell-completion --shell fish > assets/completions/borgtui.fish
    ./bin/borgtui shell-completion --shell zsh > assets/completions/_borgtui
    mkdir -p assets/man
    ./bin/borgtui install-man-pages assets/man
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/share/man/man1/"
    install -Dm755 ./bin/borgtui "${pkgdir}/usr/bin/borgtui"
    install -Dm644 assets/man/* -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 assets/completions/borgtui.bash "${pkgdir}/usr/share/bash-completion/completions/borgtui.bash"
    install -Dm644 assets/completions/borgtui.fish "${pkgdir}/usr/share/fish/vendor_completions.d/borgtui.fish"
    install -Dm644 assets/completions/_borgtui "${pkgdir}/usr/share/zsh/site-functions/_borgtui"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
