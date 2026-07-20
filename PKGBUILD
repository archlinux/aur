# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=o2-rs
_pkgname=o2
pkgver=0.3.4
pkgrel=1
pkgdesc='Rust port of the ORCΛ esoteric programming language and terminal livecoding environment'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/coignard/o2'
license=('GPL-3.0-or-later')
makedepends=('cargo')
options=(
    !strip
    !debug
)
provides=('o2')
conflicts=('o2-rs-git' 'o2-rs-bin')
source=(
    "${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    "Cargo-${pkgver}.lock"
)
sha256sums=(
    '069de70c8dd93be2434f9f8b1a4a3b4fc77953db86ea6f1cfc67675976d0eea7'
    'd885d21077c5aedbd7140627dcfe26aee6972ef6d65da046bff4835b4544c9b0'
)

prepare() {
    cd "${_pkgname}-${pkgver}"
    mv ../Cargo-"${pkgver}".lock Cargo.lock
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
