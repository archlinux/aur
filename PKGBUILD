# Maintainer: Pasqual Troncone <pasqualtroncone at gmail dot com>

pkgname=ai-jail
pkgver=0.10.2
pkgrel=1
pkgdesc='Sandbox for AI coding agents (bubblewrap on Linux, sandbox-exec on macOS)'
arch=('x86_64')
url='https://github.com/akitaonrails/ai-jail'
license=('GPL-3.0-only')
depends=('bubblewrap' 'glibc' 'gcc-libs')
optdepends=(
    'mise: language version management inside the sandbox'
    'docker: Docker socket passthrough'
)
makedepends=('cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/akitaonrails/ai-jail/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=(
    '762aa7907e5e70d4272181144716bc9e6b908421a31a3d5c863d0b61d16a71f0d3cfb37db7891c33e592b2055d85fe340affc44f292bf4e07592a182cbb0e042'
)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
