# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-dfu
pkgver=0.1.3
pkgrel=7
pkgdesc="cargo extension for flashing embedded rust programs via dfu based on jacobrosenthals cargo-hf2"
arch=($CARCH)
url="https://github.com/dfu-rs/cargo-dfu"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=()
makedepends=('git' 'rust')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('156b4ae9bd260972186fb9d90e2c838a26835940b09c038ab2899cb90ccdb32f')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${pkgname}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 udev.rules "$pkgdir/usr/lib/udev/rules.d/90-cargo-dfu.rules"
}
