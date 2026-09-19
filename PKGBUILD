# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=buildprof
pkgver=0.2.7
pkgrel=1
pkgdesc="Records every process and file access in a build and shows it as an interactive timeline"
arch=('x86_64' 'aarch64')
url="https://buildprof.lalitm.com"
license=('Apache-2.0')
depends=('gcc-libs' 'zstd')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LalitMaganti/buildprof/releases/download/v${pkgver}/source.tar.gz")
sha256sums=('f1c5961f0719c0f25b35ae9dd45fa7cda002f14590817ed78f3ac9712411bce6')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix $PWD=/"
    # Link the system zstd instead of building the C library bundled with zstd-sys
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix $PWD=/"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/buildprof "$pkgdir/usr/bin/buildprof"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
