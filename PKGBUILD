# Maintainer: Maria <maria@kuuro.net>
pkgname=zerobrew-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="High-performance drop-in Homebrew replacement written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasgelfond/zerobrew"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'sqlite' 'openssl' 'zlib' 'xz')
makedepends=('git' 'rust' 'cargo')
provides=('zerobrew' 'zb')
conflicts=('zerobrew' 'zb')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/lucasgelfond/zerobrew.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    cargo test --locked
}

package() {
    cd "$pkgname"

    # Install binaries
    install -Dm755 "target/release/zb" "$pkgdir/usr/bin/zb"
    install -Dm755 "target/release/zbx" "$pkgdir/usr/bin/zbx"

    # Install licenses
    install -Dm644 LICENSE-MIT.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Generate and install shell completions
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"

    ./target/release/zb completion bash >"$pkgdir/usr/share/bash-completion/completions/zb"
    ./target/release/zb completion zsh >"$pkgdir/usr/share/zsh/site-functions/_zb"
    ./target/release/zb completion fish >"$pkgdir/usr/share/fish/vendor_completions.d/zb.fish"
}
