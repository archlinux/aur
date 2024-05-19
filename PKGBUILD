# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=0.9.4
pkgrel=1
pkgdesc='KernelSU userspace cli'
arch=('any')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/KernelSU/archive/v$pkgver.tar.gz")
sha512sums=('94e68c35118b75b4a5a77940c2a83b1534aed59ee7216fb08dafc3f677a6b47768b44a91749ef470bf59413832acdf230178bc95261c7386d47c784a276d6617')

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
