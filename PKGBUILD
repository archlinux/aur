# Maintainer: taotieren <admin@taotieren.com>

pkgname=socketcan-rs-git
pkgver=3.3.0.r54.gd7942d5
pkgrel=1
pkgdesc="Linux SocketCAN access in Rust"
arch=($CARCH)
url="https://github.com/socketcan-rs/socketcan-rs"
license=('MIT')
provides=(${pkgname%-git} rcan)
conflicts=(${pkgname%-git} rcan)
replaces=()
depends=(gcc-libs
    glibc)
makedepends=(
    cargo
    git
    mold)
checkdepends=()
backup=()
options=('!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    mold -run cargo build --release --all-features
    #     && \
    #     cargo doc --release --no-default-features && \
    #     cargo clippy --release --no-default-features
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     ./scripts/vcan.sh
#     cargo test --features=vcan_tests
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    #     install -Dm0755 target/release/AirISP-next "$pkgdir/usr/${pkgname%-git}"
}
