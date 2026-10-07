# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=bootc
pkgver=1.17.1
pkgrel=1
pkgdesc='Boot and upgrade via container images'
url='https://github.com/bootc-dev/bootc'
license=('Apache-2.0 OR MIT')
makedepends=(
    cargo
    go-md2man
)
depends=(
    bash
    gcc-libs
    glib2
    glibc
    openssl
    ostree
    zlib
    zstd
)
arch=('x86_64')
source=("https://github.com/bootc-dev/bootc/releases/download/v$pkgver/bootc-$pkgver.tar.zstd")
sha256sums=('8d06b7b20e6a3fe862275f089a2ac5275ff91151de2e3f0ef090a426292ab3dd')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release
    cargo run --frozen --package xtask -- manpages
}

check() {
    cd $pkgname-$pkgver
    cargo test --frozen
}

package() {
    make -C $pkgname-$pkgver DESTDIR=$pkgdir install

    install -m 644 -t $pkgdir/usr/share/doc/$pkgname -D $pkgname-$pkgver/README.md

    install -m 644 -t $pkgdir/usr/share/licenses/$pkgname -D $pkgname-$pkgver/LICENSE-APACHE
    install -m 644 -t $pkgdir/usr/share/licenses/$pkgname -D $pkgname-$pkgver/LICENSE-MIT
}
