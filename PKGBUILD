# Maintainer: taotieren <admin@taotieren.com>

pkgname=probe-rs-git
pkgver=0.27.0.r72.gb639d3f
pkgrel=2
pkgdesc="A debugging toolset and library for debugging embedded ARM and RISC-V targets on a separate host"
arch=($CARCH)
url="https://github.com/probe-rs/probe-rs"
license=('Apache-2.0 AND MIT')
provides=(${pkgname%-git}
    cargo-embed
    cargo-flash
    rtthost
    smoke_tester
    target-gen
    xtask)
conflicts=(${pkgname%-git}
    cargo-embed
    cargo-flash
    rtthost
    smoke_tester
    target-gen
    xtask)
replaces=()
depends=(gcc-libs
    glibc
    libusb
    libftdi
    systemd-libs)
makedepends=(git
    rust
    cmake
    openssl
    pkgconf)
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
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

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
