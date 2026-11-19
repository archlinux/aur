# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=flux9s
pkgver=1.5.4
pkgrel=1
pkgdesc="A K9s-inspired terminal UI for monitoring Flux resources in real-time"
arch=('x86_64' 'aarch64')
url="https://github.com/dgunzy/flux9s"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=(!lto) # depends on `ring`, which doesn't compile with LTO
source=("$pkgname-$pkgver.tar.gz::https://github.com/dgunzy/flux9s/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('adaac2fbda9ccf8acdcbe8430082e5fa480412bbef2f3be6f497ae29654c2e4d')

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
