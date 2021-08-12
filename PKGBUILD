# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=exa
pkgname=${_pkgname}-git
pkgver=0.10.1.r33.g3f24f7c
pkgrel=1
pkgdesc='Replacement for ls written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/ogham/exa"
license=('MIT')
depends=('libgit2')
makedepends=('cargo' 'git' 'pandoc')
provides=('exa')
conflicts=('exa')
source=("git+https://github.com/ogham/exa.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd $_pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    mkdir -p target/release/man
    pandoc --standalone -f markdown -t man man/exa.1.md        > "target/release/man/exa.1"
    pandoc --standalone -f markdown -t man man/exa_colors.5.md > "target/release/man/exa_colors.5"
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 completions/bash/$_pkgname \
        -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/zsh/_$_pkgname \
        -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/fish/$_pkgname.fish \
        -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "target/release/man/$_pkgname.1" \
        -t "$pkgdir/usr/share/man/man1"
    install -Dm644 "target/release/man/${_pkgname}_colors.5" \
        -t "$pkgdir/usr/share/man/man5"
}
