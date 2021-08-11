# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mdbook-git
pkgver=0.4.12.r0.ge6629cd7
pkgrel=2
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('mdbook')
conflicts=('mdbook')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd mdBook
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd mdBook
    mkdir -p completions/
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd mdBook
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    ./target/release/mdbook completions bash > completions/mdbook.bash
    ./target/release/mdbook completions fish > completions/mdbook.fish
    ./target/release/mdbook completions zsh > completions/_mdbook
}

check() {
    cd mdBook
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd mdBook
    install -Dm755 target/release/mdbook -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/mdbook"
    install -Dm644 completions/mdbook.bash "$pkgdir/usr/share/bash-completion/completions/mdbook"
    install -Dm644 completions/mdbook.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 completions/_mdbook -t "$pkgdir/usr/share/zsh/site-functions"
}
