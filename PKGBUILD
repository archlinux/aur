# Maintainer: taotieren <admin@taotieren.com>

pkgname=kickstart-rs
_name=${pkgname%-rs}
pkgver=0.6.0
pkgrel=1
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
sha256sums=('0888ca59bc11e2c9531957047973b3f4d28e4270c03d1272f29d8b73f12bb142')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
