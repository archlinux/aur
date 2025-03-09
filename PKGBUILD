# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-dfu
pkgver=0.1.0
pkgrel=15
pkgdesc="cargo extension for flashing embedded rust programs via dfu based on jacobrosenthals cargo-hf2"
arch=($CARCH)
url="https://github.com/dfu-rs/cargo-dfu"
license=('MIT')
provides=()
conflicts=(${pkgname}-git)
#replaces=(${pkgname})
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6760a77f43721b2b516e5046a56c23e66a5e8f3bc187ccd69531494af445c188')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 udev.rules "$pkgdir/usr/lib/udev/rules.d/90-cargo-dfu.rules"
}
