# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.3.0
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nasedkinpv/numr/archive/v$pkgver.tar.gz")
sha256sums=('2315ee4016b466d5c72f3d1febcc63a4c7dbed6f0961a74f0a80ea7047f590ff')

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
