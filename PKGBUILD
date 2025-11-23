# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=bootc
pkgver=1.10.0
pkgrel=3
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
sha256sums=('39b39a9bb92680f1690e262c7190fb9cd2d5f2dec8d2904df2bbaecd594d1118')

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
    # TODO: leave just else branch after 1.11.0 is released
    if grep -q install-initramfs-dracut $pkgname-$pkgver/Makefile; then
        make -C $pkgname-$pkgver DESTDIR=$pkgdir install-all install-initramfs-dracut
    else
        make -C $pkgname-$pkgver DESTDIR=$pkgdir install-all
    fi

    install -m 644 -t $pkgdir/usr/share/doc/$pkgname -D $pkgname-$pkgver/README.md

    install -m 644 -t $pkgdir/usr/share/licenses/$pkgname -D $pkgname-$pkgver/LICENSE-APACHE
    install -m 644 -t $pkgdir/usr/share/licenses/$pkgname -D $pkgname-$pkgver/LICENSE-MIT
}
