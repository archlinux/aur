# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=jellyfin-rpc
pkgver=0.14.2
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Radiicall/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('589d93db615d023b54edc0f99412cda0ded55be2af0a8886796fc0a5422fbddd')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    sed -i "s|^ExecStart=.*\$|ExecStart=/usr/lib/$pkgname/$pkgname|" scripts/$pkgname.service
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
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm0644 "scripts/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
}
