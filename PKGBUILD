# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=jellyfin-rpc
pkgver=1.3.3
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('python: for the configuration script')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Radiicall/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a8c84292453ade335472f3db1ca9e9604ba8fdcf7830edc2834a39d257854b544f6a90b7422b88e9061b1222a0b89391f931869ec323973fb952e270740fd797')

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
    cargo build --frozen --release --all-features --no-default-features
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

    install -Dm644 "scripts/installer.py" -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
