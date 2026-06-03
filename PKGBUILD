# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: wuxxin <wuxxin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=moltis
pkgver=20260603.01
_commit=d70d6920c805afb5712ef8d92c8453851b915936
pkgrel=1
pkgdesc="A secure persistent personal agent server in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/moltis-org/moltis"
license=('MIT')
depends=('libgcc_s.so')
makedepends=(
    clang
    cargo
    cmake
    git
    nodejs
    npm
    just
)
options=(!lto !debug)
source=("$pkgname::git+$url#commit=${_commit}?signed")
sha256sums=('0af0808f3f4a4fcf6f93b3afcee2adb19fd8c41bfae715c4dade65c585089ad0')
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
