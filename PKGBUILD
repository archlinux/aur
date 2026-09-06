# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# WARNING: This package uses a lot of memory to build (16+ GB)

pkgname=symbolicator
pkgver=26.8.0
pkgrel=1
pkgdesc="A sentry symbolication service for native stacktraces"
arch=(x86_64)
url="https://github.com/getsentry/symbolicator"
license=(FSL-1.1-MIT)
depends=(
    glibc
    libgcc      libgcc_s.so
    jemalloc    libjemalloc.so
    openssl     libcrypto.so libssl.so
    zstd        libzstd.so)
makedepends=(cargo git)
backup=('etc/symbolicator/symbolicator.yml')
options=(!lto)
source=(
    "$pkgname::git+$url#tag=$pkgver"
    "symbolicator.service")
sha256sums=('a6ae72a7e269ecfd8c1244ccbf5ce615e0c99a9ed4d94967e52a0441ac89eb8d'
            '1e249394e2f17aba6c8c4d44bf6ad473669d020f2a1627085f82c8cc0cc96f47')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc.so
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
    export OPENSSL_NO_VENDOR=1
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc.so
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
    export OPENSSL_NO_VENDOR=1
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cd "$pkgname"
    ## will not run with --frozen
    cargo test --locked --workspace --all-features
}

package() {
    cd "$pkgname"
    for f in symbolicator symbolicli symsorter wasm-split; do
      install -Dm0755 target/release/$f "$pkgdir/usr/bin/$f"
    done
    install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/symbolicator/LICENSE"
    install -Dm0644 "${srcdir}/symbolicator.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm0644 local.example.yml "${pkgdir}/etc/symbolicator/symbolicator.yml"
}
