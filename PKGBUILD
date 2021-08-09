# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mdbook-git
pkgver=0.4.12.r0.ge6629cd7
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(MPL2)
makedepends=(rust git)
provides=(mdbook)
conflicts=(mdbook)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "mdBook"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    mkdir -p completions/
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd mdBook
    cargo build --frozen --release
    cargo run -- completions bash > "completions/mdbook.bash"
    cargo run -- completions fish > "completions/mdbook.fish"
    cargo run -- completions zsh > "completions/_mdbook"
}

check() {
    cd "mdBook"
    cargo test --frozen
}

package() {
    cd "mdBook"
    install -Dm 755 "target/release/mdbook" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/mdbook"
    install -Dm 644 "completions/mdbook.bash" "$pkgdir/usr/share/bash-completion/completions/mdbook"
    install -Dm 644 "completions/mdbook.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/_mdbook" -t "$pkgdir/usr/share/zsh/site-functions"
}
