# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=jellyfin-rpc
pkgver=1.3.5
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/JustRadical/$pkgname"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('python: for the configuration script')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('3a7352602bea433dcb7fcc29410a9160953c4f89a59d1865b13bb80d54d9b21cd083ad59175c1c035130d075c51a3b4b4c1392a0a51d53f3b9072a305d8adf3c')

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
    unset CFLAGS
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
