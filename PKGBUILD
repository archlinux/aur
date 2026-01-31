# Maintainer: Maria <maria@kuuro.net>
pkgname=zerobrew-git
pkgver=r109.31b8d83
pkgrel=1
pkgdesc="A drop-in, 5-20x faster, experimental Homebrew alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasgelfond/zerobrew"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'sqlite' 'openssl' 'zlib' 'xz')
makedepends=('git' 'rust' 'cargo')
provides=('zerobrew' 'zb')
conflicts=('zerobrew' 'zb')
install="$pkgname.install"
options=(!lto)
source=("$pkgname::git+https://github.com/lucasgelfond/zerobrew.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname"
    cargo test --frozen
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
