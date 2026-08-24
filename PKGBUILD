# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=svg-hush
pkgver=0.9.7
pkgrel=1
pkgdesc='Sanitizes SVGs of arbitrary code'
arch=(x86_64)
url='https://github.com/cloudflare/svg-hush'
license=('MIT OR Apache-2.0')
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('74534690eaee5a8504ac0ded7a7dcd1451d35598401fdf2cd4f8dc1a813745c0')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
