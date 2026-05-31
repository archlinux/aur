# Maintainer: wuxxin <wuxxin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=moltis-git
pkgver=20260529.02.r0.g6de135a28
pkgrel=1
pkgdesc="A personal AI gateway written in Rust. One binary, sandboxed, secure. (Git VCS version)"
arch=('x86_64' 'aarch64')
url="https://github.com/moltis-org/moltis"
license=('MIT')
provides=("moltis")
conflicts=("moltis")
replaces=()
depends=(
    gcc-libs
    glibc
    openssl
    systemd-libs
)
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
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"

    # Increase recursion limit for all crate roots
    for f in crates/*/src/lib.rs crates/*/src/main.rs; do
        if [ -f "$f" ]; then
            sed -i '/recursion_limit/d' "$f"
            echo '#![recursion_limit = "2048"]' | cat - "$f" >temp && mv temp "$f"
        fi
    done

    # Disable matrix feature globally as it causes build failure on stable Rust
    find . -name "Cargo.toml" -exec sed -i 's/"matrix",//g' {} +
    find . -name "Cargo.toml" -exec sed -i 's/"moltis-matrix\/metrics",//g' {} +

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Build web UI assets
    just build-web-assets

    # Build WASM components
    # cargo build --target wasm32-wasip2 -p moltis-wasm-calc -p moltis-wasm-web-fetch -p moltis-wasm-web-search --release
    # cargo run -p moltis-wasm-precompile --release

    # Build release binary
    cargo build --release -p moltis --features full
}

package() {
    cd "${srcdir}/${pkgname%-git}/"

    install -Dm0755 target/release/moltis -t "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/moltis/web"
    cp -R --no-preserve=mode crates/web/src/assets/* "${pkgdir}/usr/share/moltis/web/"
    # install -Dm0644 -t "${pkgdir}/usr/share/moltis/wasm/" target/wasm32-wasip2/release/moltis_wasm_calc.wasm
    # install -Dm0644 -t "${pkgdir}/usr/share/moltis/wasm/" target/wasm32-wasip2/release/moltis_wasm_web_fetch.wasm
    # install -Dm0644 -t "${pkgdir}/usr/share/moltis/wasm/" target/wasm32-wasip2/release/moltis_wasm_web_search.wasm
    install -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
