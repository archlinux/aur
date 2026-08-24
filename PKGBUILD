# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=bootc-bcvk
_pkgname=bcvk
pkgver=0.19.0
pkgrel=1
pkgdesc='Launches ephemeral VMs from bootc containers and creates disk images.'
url='https://github.com/bootc-dev/bcvk'
license=('Apache-2.0 OR MIT')
makedepends=(
    cargo
)
depends=(
    glibc
    openssh
    qemu-system-x86
    virtiofsd
    podman
)
arch=(x86_64)
source=("https://github.com/bootc-dev/bcvk/releases/download/v$pkgver/bcvk-$pkgver.tar.zstd")
sha256sums=('49c6f4f5c86b0e0f56577d73db147d8acd70922fae337ed071eaac7622e6e138')

prepare() {
    set -x
    cd $_pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CARGO_TARGET_DIR=target
    cd $_pkgname-$pkgver
    cargo build --frozen --release
}

check() {
    export RUST_BACKTRACE=1
    cd $_pkgname-$pkgver
    cargo test --frozen
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $_pkgname-$pkgver/target/release/bcvk

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/$pkgname
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/$pkgname $_pkgname-$pkgver/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses/$pkgname
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/$pkgname $_pkgname-$pkgver/LICENSE-APACHE
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/$pkgname $_pkgname-$pkgver/LICENSE-MIT
}
