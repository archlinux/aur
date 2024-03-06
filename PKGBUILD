# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=1.3.0
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'python-docutils' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/v$pkgver.tar.gz")
sha256sums=('a9a6bad03a2c5ec0753d8c85d9c1b5c55eb7270b2b15cb9a1f458a458114b200')
options+=(emptydirs)

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    mv Makefile Makefile.release
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    make -f Makefile.release DESTDIR="$pkgdir" SBINDIR="/usr/bin" install
}
