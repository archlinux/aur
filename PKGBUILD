# Maintainer: taotieren <admin@taotieren.com>

pkgname=ironplc
pkgver=0.232.0
pkgrel=1
pkgdesc="Prototype Rust-based SoftPLC"
arch=($CARCH)
url="https://github.com/ironplc/ironplc"
license=('MIT')
provides=(
    ${pkgname}
)
conflicts=(
    ${pkgname}
)
replaces=()
depends=(
    libgcc
    glibc
)
makedepends=(
    git
    rust
)
optdepends=()
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('270d0bdf6395ab56e8280f6791c822a944003ff68698abaf41b3ddc7ec9884d5')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/compiler"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/compiler"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build \
        --offline \
        --locked \
        --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/compiler"

    export RUSTUP_TOOLCHAIN=stable
    # cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -regex ".*/[^./]+$" \
        -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +

    install -vDm644 *.md -t "$pkgdir/usr/share/doc/${pkgname}/"
    install -vDm644 ../LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
