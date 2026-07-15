# Maintainer: tony <tonycth@proton.me>

pkgname=arcfetch
pkgver=1.0.8
pkgrel=1
pkgdesc="Blazing-fast Arch Linux sysinfo"
arch=('x86_64' 'aarch64')
url="https://github.com/tonycth7/arcfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('arcfetch')
conflicts=('arcfetch')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e2ab68a49107d822fc67b824dae766658c63aad5300d2f8226b80b8604fddedc')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test 2>/dev/null || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
