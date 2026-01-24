# Maintainer: Martin Stark <martinstark@protonmail.com>
pkgname=ralph
pkgver=0.1.0
pkgrel=1
pkgdesc="Autonomous AI agent loop for Claude Code CLI"
arch=('x86_64')
url="https://github.com/martinstark/ralph-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d0d864c113ba5b1d51f88bf55210d34e0b0883d860ec1ad6508b8afc3b4d7f70')

prepare() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "ralph-rs-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ralph"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
