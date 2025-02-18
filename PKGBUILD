# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=1.4.0
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'python-docutils' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/v$pkgver.tar.gz")
sha256sums=('0b3a36fc8412ec5a5cf58ad3ce514e79d58dcac71a133f313759c8c0793377a2')
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
