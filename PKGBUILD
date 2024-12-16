# Maintainer: taotieren <admin@taotieren.com>

pkgname=kickstart-rs
_name=${pkgname%-rs}
pkgver=0.5.0
pkgrel=0
pkgdesc="A scaffolding tool to get new projects up and running quickly"
arch=($CARCH)
url="https://github.com/Keats/kickstart"
license=('MIT')
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
# replaces=(${pkgname} ${_name})
depends=(
    gcc-libs
    glibc
)
makedepends=(
    cargo
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a1a335c70b81757abf4240a52ebce231501f731f3d73decbed4133d18ad1386')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${_name}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --features=cli --root "$pkgdir/usr/" --path .
    #     --all-features --features=cli
}
