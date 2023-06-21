# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>
# Co-maintainer: Karx <yash@karx.xyz>

pkgname="zdiu"
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.karx.xyz/karx/zdiu"
license=("MIT")
# See issue: https://github.com/briansmith/ring/issues/1444
options=('!lto')
depends=("gtk3" "gcc-libs" "gdk-pixbuf2")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://git.karx.xyz/karx/$pkgname/archive/$pkgver.tar.gz"
        $pkgname.desktop)
sha256sums=('fc1a7116fcb91bab4d19b78a55038a571e2c920cbe2d7420f2ae790e641f5fa6'
            'b259282b904509c1ac8ff64e48e972a44d63086ad6fe7c952567a922a79126ed')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    # Install included desktop file
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

    # Install upstream files
    cd "$pkgname"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "zdiu-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
