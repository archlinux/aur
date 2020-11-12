# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=exa
pkgname=${_pkgname}-git
pkgver=0.9.0.r184.g39c8c67
pkgrel=2
pkgdesc='Replacement for ls written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/ogham/exa"
license=('MIT')
depends=('libgit2')
makedepends=('rust' 'git' 'pandoc')
provides=('exa')
conflicts=('exa')
source=("git+https://github.com/ogham/exa.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd $_pkgname
    cargo build --locked --release
    mkdir -p target/release/man
    pandoc --standalone -f markdown -t man man/exa.1.md        > "target/release/man/exa.1"
    pandoc --standalone -f markdown -t man man/exa_colors.5.md > "target/release/man/exa_colors.5"
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 completions/completions.bash \
        "$pkgdir/etc/bash_completion.d/$_pkgname"
    install -Dm644 completions/completions.zsh \
        "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 completions/completions.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "target/release/man/$_pkgname.1" \
        -t "$pkgdir/usr/share/man/man1"
    install -Dm644 "target/release/man/${_pkgname}_colors.5" \
        -t "$pkgdir/usr/share/man/man5"
}
