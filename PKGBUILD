# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=owl-write-git
_pkgname=owl-write
pkgver=0.5.0.r4.g2424d09
pkgrel=1
pkgdesc='Quick spellcheck TUI'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://codeberg.org/jpt/owl-write'
license=('GPL-3.0-or-later')
makedepends=(
    'cargo'
    'git'
)
options=(
    !debug
    !strip
)
provides=('owl')
conflicts=('owl-write')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/owl "$pkgdir/usr/bin/owl"
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
