# Maintainer: taotieren <admin@taotieren.com>

pkgname=kickstart-rs
_name=${pkgname%-rs}
pkgver=0.6.0
pkgrel=2
pkgdesc="A scaffolding tool to get new projects up and running quickly"
arch=($CARCH)
url="https://github.com/Keats/kickstart"
license=('MIT')
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
# replaces=(${pkgname} ${_name})
depends=()
makedepends=(
    git
    cargo
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${_name}::git+${url}.git#tag=v${pkgver}")
sha256sums=('ec424d788a88e1c26cef2d1ada8b3a367b473d7ce5389291d66a8a2944512eb8')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${_name}/"
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${_name}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${_name}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --features=cli --root "$pkgdir/usr/" --path .
    #     --all-features --features=cli
}
