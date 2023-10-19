# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=jellyfin-rpc
pkgver=0.15.3
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Radiicall/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('9542c54b3d30807ba1af1a6d25a8f80381fbb13a98488dce823c0326e7b1d18d0dc116bf87746f0dfd8aa5ffd221dc94a4163502cde92b3bbd6172a3d6b9aef5')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/lib/$pkgname/"

    install -Dm644 "scripts/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
