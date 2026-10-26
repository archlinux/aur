# Maintainer: tony <tonycth@proton.me>

pkgname=arcfetch
pkgver=1.1.0
pkgrel=1
pkgdesc="Blazing-fast Unix sysinfo"
arch=('x86_64' 'aarch64')
url="https://github.com/tonycth7/arcfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
# Run `updpkgsums` after the v1.1.0 tag and tarball exist.
sha256sums=('3b851c8571bda86c4c2bce68313b2d1f603ad85758bd497f7076389cfacf61b3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -d "$pkgdir/usr/share/arcfetch/presets"
    cp -R presets/examples "$pkgdir/usr/share/arcfetch/presets/"
}
