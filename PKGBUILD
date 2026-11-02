# Maintainer: agony <27015 at riseup dot net>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mdbook-git
pkgver=0.5.4.r134.g7fb5bc8
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust (git version)"
url="https://github.com/rust-lang/mdBook"
arch=('x86_64' 'aarch64')
license=('MPL-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=('mdbook')
conflicts=('mdbook')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd mdBook
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd mdBook
    mkdir -p completions/
    cargo fetch --locked --target host-tuple
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
