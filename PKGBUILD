# Maintainer: neonvoidx <me@neonvoid.dev>
pkgname=timesup
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight terminal timer with desktop notifications that runs as a daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/neonvoidx/timesup"
license=('MIT')
depends=('alsa-lib' 'libnotify')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neonvoidx/timesup/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6bc98cb67c3e6e718245806038d73a9f49822808bbad4759b8973f56eb90d616')

prepare() {
    cd "$pkgname-$pkgver"
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
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
