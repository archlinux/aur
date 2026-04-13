# Maintainer: taotieren <admin@taotieren.com>

pkgname=loof
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, cross-platform replacement for lsof written in Rust, featuring an interactive TUI mode with fuzzy search"
arch=($CARCH)
url="https://github.com/uk0/lsof"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc
)
makedepends=(
    git
    rust
)
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f0ef8cc54a75b36903e3b9ba63da26e801bb1eba6e234bd88a5a9a8214bf41e7')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #     cargo build --release --all-features
    CFLAGS+=" -ffat-lto-objects"
    #    --features 'cli,ftdi' \
    cargo build \
        --offline \
        --locked \
        --release
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    # cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    install -vDm644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
