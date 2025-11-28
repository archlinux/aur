# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.1.4
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nasedkinpv/numr/archive/v$pkgver.tar.gz")
sha256sums=('20e8e60ce8a9b4951ba476eba03fefb563ec9c28dc1887417347f4cff2cd9185')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "target/release/numr-cli" "$pkgdir/usr/bin/numr-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
