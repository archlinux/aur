# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=bootc-bcvk
_pkgname=bcvk
pkgver=0.17.0
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
sha256sums=('75f949327e0ef05f5d1e37450f43ae8a5e8ddd6620baff07b6e6e45f7753c90e')

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
