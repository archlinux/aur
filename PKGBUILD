# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=flux9s
pkgver=1.5.2
pkgrel=1
pkgdesc="A K9s-inspired terminal UI for monitoring Flux resources in real-time"
arch=('x86_64' 'aarch64')
url="https://github.com/dgunzy/flux9s"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=(!lto) # depends on `ring`, which doesn't compile with LTO
source=("$pkgname-$pkgver.tar.gz::https://github.com/dgunzy/flux9s/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('206634a4cc2af3e5e901d57a17ee718c7edf4068e161cd30840b7675f8935457')

prepare() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
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
}
