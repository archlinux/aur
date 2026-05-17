# Maintainer: Zhiyu Huang <zhiyuh@ccat.dev>
# Contributor: Crush <crush@ccat.dev>

pkgname=ccat-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Enhanced cat tool — auto-detect and display markdown, docx, images, and gz files"
arch=('x86_64' 'aarch64')
url="https://github.com/zhiyuHD/ccat"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhiyuHD/ccat/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums='59755dea12502bfa621fe8ce3c9e9c608aa08cb3285e06486389c17fbb2926a1'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_BUILD_JOBS=$(nproc)
    # Use system oniguruma instead of onig_sys building its own
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ccat "$pkgdir/usr/bin/ccat"
}
