# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-dfu
pkgver=0.1.3
pkgrel=6
pkgdesc="cargo extension for flashing embedded rust programs via dfu based on jacobrosenthals cargo-hf2"
arch=($CARCH)
url="https://github.com/dfu-rs/cargo-dfu"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=('git' 'rust')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66e5c4481da5894278a8d52617f912c376988c19a1f0aabcf671b22722adf680')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
