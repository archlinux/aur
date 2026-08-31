# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dominic Meiser [git at msrd0 dot de]

pkgname=cargo-diet
pkgver=1.4.1
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo manifests'
url='https://github.com/the-lean-crate/cargo-diet'
license=(MIT)
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ae9581925a93704624dd9934710d979d2d947b7feeb07fa02571f57d6183749e3f19fcdb746edeaafbd6b38f2fec33ab6273e989f31fcaa89cf321dde3a35f13')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=(aarch64 i686 x86_64)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"

    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/cargo-diet -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
