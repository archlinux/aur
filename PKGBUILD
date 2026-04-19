# Maintainer: Pasqual Troncone <pasqualtroncone at gmail dot com>

pkgname=ai-jail
pkgver=0.9.0
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
    '87de70a9281ec08237877efa74d0ddb9939a73aa0f28b79e181760c825c6b3fa08fcd3ee21de79dbe1133fb94cdf105aa2542267b44e4e7351a756f68f59ddf3'
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
