# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=bootc
pkgver=1.10.0
pkgrel=2
pkgdesc='Boot and upgrade via container images'
url='https://github.com/bootc-dev/bootc'
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=(
    gcc
    glibc
    ostree
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
}

check() {
    cd $pkgname-$pkgver
    cargo test --frozen
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-$pkgver/target/release/bootc
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-$pkgver/target/release/bootc-initramfs-setup

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/$pkgname
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/$pkgname $pkgname-$pkgver/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses/$pkgname
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/$pkgname $pkgname-$pkgver/LICENSE-APACHE
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/$pkgname $pkgname-$pkgver/LICENSE-MIT
}
