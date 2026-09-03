# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent
pkgver=0.13.0
pkgrel=1
pkgdesc='A prior-art search for your code ideas. Stop building what already exists.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/r14dd/patent'
license=(
    'Apache-2.0'
    'MIT'
)
optdepends=(
    'ollama: powers the LLM verdict'
)
makedepends=(
    'cargo'
    'openssl'
    'gcc'
)
options=(
    !lto
    !debug
)
provides=('patent')
conflicts=('patent-git' 'patent-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'patent.install'
)
install=patent.install
sha256sums=(
    'b5e2973f04540ac54e860f277ada206131587107671fa0a22e01f71bd0514bf4'
    '24dff75c38b578cb7e8057366a764cb4313078f16bada568baf79ecde5cb49af'
)

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
