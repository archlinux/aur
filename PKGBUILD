# Maintainer: taotieren <admin@taotieren.com>

pkgname=mtk-uartboot-rs
pkgver=0.1.1
pkgrel=4
pkgdesc="A third-party tool to load and execute binaries over UART for Mediatek SoCs."
arch=($CARCH)
url="https://github.com/981213/mtk_uartboot"
license=('AGPL-3.0-or-later')
provides=(${pkgname} ${pkgname%-rs})
conflicts=(${pkgname} ${pkgname%-rs})
replaces=()
depends=(gcc-libs
    glibc)
makedepends=(git
    cargo)
backup=()
options=('!strip' '!debug' '!lto')
#install=${pkgname}.install
_pkgname=${pkgname%-rs}
_pkgname=${_pkgname//-/_}
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aabff77ccd52ca5bc32cad03aa1d64e3568418f9c94883f8e8043a50f05ac65c')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    #     install -Dm0644 udev.rules "$pkgdir/usr/lib/udev/rules.d/90-cargo-dfu.rules"
}
