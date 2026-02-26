# Maintainer: taotieren <admin@taotieren.com>

pkgname=mtk-uartboot-rs
pkgver=0.1.1
pkgrel=6
pkgdesc="A third-party tool to load and execute binaries over UART for Mediatek SoCs."
arch=($CARCH)
url="https://github.com/981213/mtk_uartboot"
license=('AGPL-3.0-or-later')
provides=(${pkgname} ${pkgname%-rs})
conflicts=(${pkgname} ${pkgname%-rs})
replaces=()
depends=(
    gcc-libs
    glibc
)
makedepends=(
    git
    rust
)
backup=()
options=('!strip' '!debug' '!lto')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('0be22d626212cd844d79647738a0c000c705d677afc22b40f852f048e20dbe68')

prepare() {
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
    #     install -Dm0644 udev.rules "$pkgdir/usr/lib/udev/rules.d/90-cargo-dfu.rules"
}
