# Maintainer: taotieren <admin@taotieren.com>

pkgname=ironplc
pkgver=0.246.0
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
depends=()
makedepends=(
    git
    rust
)
optdepends=()
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('847965976d65a5b4225463761b4d88acc11a2500bab43eef6599a3678e66763e')

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
