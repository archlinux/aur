# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=uniimage
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI converter and codec library for the uniimage (.uimg) format"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/uniimage"
license=('GPL3')
depends=('gcc-libs' 'zstd')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6222f9fc30c76dde338f3b2dc1e211a123dcf0eeb1f5a953760d100b1bf26cec')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release --frozen --workspace
}

check() {
    cd "$pkgname-$pkgver"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo test --release --frozen --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/uimg" "$pkgdir/usr/bin/uimg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
