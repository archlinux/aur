# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: wuxxin <wuxxin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=moltis
pkgver=20260831.01
_commit=19e4895
pkgrel=1
pkgdesc="A secure persistent personal agent server in Rust"
arch=(x86_64 aarch64)
url="https://github.com/moltis-org/moltis"
license=(MIT)
depends=(
    glibc
    openssl     libcrypto.so libssl.so
    libgomp     libgomp.so
    libgcc      libgcc_s.so
    libstdc++   libstdc++.so
    sqlite      libsqlite3.so
    zlib        libz.so
    zstd        libzstd.so
)
makedepends=(
    clang
    cargo
    cmake
    git
    nodejs
    npm
    just)
options=(!lto !debug)
source=("$pkgname::git+$url#commit=${_commit}?signed")
sha256sums=('531f762801049df1231bedacf2747c48a7f3a64acd802d329f79b1fe7a75541a')
validpgpkeys=('310320A8CC1C5BA86AD09040C0451BADF7649BBF')

prepare() {
    cd "${srcdir}/${pkgname}"
    
    # Increase recursion limit for all crate roots
    for f in crates/*/src/lib.rs crates/*/src/main.rs; do
        sed -i '/recursion_limit/d' "$f"
        echo '#![recursion_limit = "2048"]' | cat - "$f" > temp && mv temp "$f"
    done

    # Disable matrix feature globally as it causes build failure on stable Rust
    find . -name "Cargo.toml" -exec sed -i 's/"matrix",//g' {} +
    find . -name "Cargo.toml" -exec sed -i 's/"moltis-matrix\/metrics",//g' {} +

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export OPENSSL_NO_VENDOR=1
    export ZSTD_SYS_USE_PKG_CONFIG=1
    
    # Build web UI assets
    just build-web-assets
    
    # Build release binary
    cargo build --release --frozen -p moltis --features full
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dm0755 target/release/moltis -t "${pkgdir}/usr/bin/"
    install -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
