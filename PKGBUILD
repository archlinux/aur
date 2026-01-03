# Maintainer: Akhil Pillai <ackledotdev@gmail.com>

pkgname=tpnoisie
pkgver=0.3.2
pkgrel=1
pkgdesc="Make the ThinkPad TrackPoint make noises"
arch=(x86_64)
url="https://github.com/ackledotdev/tpnoisie"
license=(MIT)
makedepends=('cargo' 'git')
depends=('libinput' 'alsa-lib' 'glibc' 'gcc-libs')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('74024158dee18a233ab63124f60e6ffa572389223e522f6cc52d2c9616a216fc')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}

