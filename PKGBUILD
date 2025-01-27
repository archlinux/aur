# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=jellyfin-rpc
pkgver=1.3.1
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
sha512sums=('5e3dcadd460c8509c89e5d3d7cc23ae832e7246f18fc8159c1dc751dc5fb4acb3e8a87922be402b8a9ae500997062c552ec69ca0f17e759057f16ee4469f8a92')

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
