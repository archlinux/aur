# Maintainer: wuxxin <wuxxin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=moltis
pkgver=20260510.01
pkgrel=1
pkgdesc="A personal AI gateway written in Rust. One binary, sandboxed, secure."
arch=('x86_64' 'aarch64')
url="https://github.com/moltis-org/moltis"
license=('MIT')
provides=(
    ${pkgname}
)
conflicts=(
    ${pkgname}
)
replaces=()
depends=(
    gcc-libs
    glibc
    openssl
    systemd-libs)
makedepends=(
    clang
    cargo
    cmake
    git
    nodejs
    npm
    just
)
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('14d940e4290036985dbdfc4a4c6c50255b03c3fbcc2a173b4d3313370fba7c51')

prepare() {
    cd "${srcdir}/${pkgname}"
    
    # Increase recursion limit for all crate roots
    for f in crates/*/src/lib.rs crates/*/src/main.rs; do
        if [ -f "$f" ]; then
            sed -i '/recursion_limit/d' "$f"
            echo '#![recursion_limit = "2048"]' | cat - "$f" > temp && mv temp "$f"
        fi
    done

    # Disable matrix feature globally as it causes build failure on stable Rust
    find . -name "Cargo.toml" -exec sed -i 's/"matrix",//g' {} +
    find . -name "Cargo.toml" -exec sed -i 's/"moltis-matrix\/metrics",//g' {} +

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Build web UI assets
    just build-web-assets
    
    # Build release binary
    cargo build --release -p moltis --features full
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
