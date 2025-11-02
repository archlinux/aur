# Maintainer: metaneutrons <https://github.com/metaneutrons>
pkgname=png2lvgl
pkgver=0.2.3
pkgrel=1
pkgdesc="Convert PNG images to LVGL C arrays"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/png2lvgl"
license=('GPL-3.0-or-later')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metaneutrons/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install manpage (generated during build)
    find target/release/build/$pkgname-*/out/$pkgname.1 -exec install -Dm644 {} "$pkgdir/usr/share/man/man1/$pkgname.1" \;
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
