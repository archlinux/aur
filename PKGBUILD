# Maintainer: Pando85 <pando855@gmail.com>

_pkgname=timer-rs
pkgname="${_pkgname}"
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple countdown terminal alarm"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pando85/timer"
license=('GPL')
depends=('gcc-libs'
         'alsa-lib')
makedepends=('cargo'
             'pkgconf'
             'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git#tag=v${pkgver}?signed")
validpgpkeys=('CD1DB60B2C8465FD50028EF6D381D73787B45B3E')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/timer"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/timer"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/timer"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/timer"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/timer"
}
