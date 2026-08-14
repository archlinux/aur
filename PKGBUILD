# Maintainer: taotieren <admin@taotieren.com>

pkgname=afptool-rs
pkgver=1.2.4
pkgrel=1
pkgdesc="A Rust tool for unpacking and packing RockChip firmware images (RKFW and RKAF formats)."
arch=($CARCH)
url="https://github.com/suyulin/apftool-rs"
license=("Apache-2.0")
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    libgcc_s.so
)
makedepends=(
    rust
    git
)
optdepends=()
backup=()
options=(!lto !debug !strip)
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('b1497b11ff01bcbe8f4bff82ef6f020f75495319c5efc829605c106290ace8d9')

# pkgver() {
#     cd "${srcdir}/${pkgname}"
#     (
#         set -o pipefail
#         git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
#             printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
#     )
# }

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#     export RUSTUP_TOOLCHAIN=stable
#     export CARGO_TARGET_DIR=target
#     #     cargo test --release
# }

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
