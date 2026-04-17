# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=snglrtty-git
_pkgname=snglrtty
pkgver=0.1.0.r2.g1a9c223
pkgrel=1
pkgdesc="Terminal audio visualizer — singularity in your TTY"
arch=('x86_64')
url="https://github.com/the-unknown/snglrtty"
license=('MIT')
depends=('libpulse')
makedepends=('cargo' 'pkg-config')
provides=('snglrtty')
conflicts=('snglrtty' 'snglrtty-bin')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 target/release/snglrtty "$pkgdir/usr/bin/snglrtty"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
