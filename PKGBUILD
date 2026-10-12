# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=o2-rs
_pkgname=o2
pkgver=0.3.7
pkgrel=1
pkgdesc='Rust port of the ORCΛ esoteric programming language and terminal livecoding environment'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/coignard/o2'
license=('GPL-3.0-or-later')
makedepends=(
    'cargo'
    'alsa-lib'
)
options=(
    !strip
    !debug
)
provides=('o2')
conflicts=('o2-rs-git' 'o2-rs-bin')
source=(
    "${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('dccba6c58a71b0511bc58e072c741fbc954f5b78996f358d193aec3e254f5417')

prepare() {
    cd "${_pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755 target/release/o2 "$pkgdir/usr/bin/o2"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
