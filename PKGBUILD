# Maintainer: Aleks Rutins <keeper@farthergate.com>
pkgname=cheetah
pkgver=0.2.4
pkgrel=1
pkgdesc="A fast, simple static site generator with a twist"
arch=(x86_64 aarch64)
url="https://cheetah.farthergate.com"
license=('MIT')
makedepends=(cargo)
provides=("cheetah")
conflicts=("cheetah-git")
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~aleksrutins/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('209eca28ba31e4b5a9ec4ebc4ce830847291ec86cb35084f1a9d2bfc3cd32e7b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}
