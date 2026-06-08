# Maintainer: Hibryda <guess.crypto@proton.me>
pkgname=gnfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A neofetch/fastfetch alternative that renders system info as a graphical card or ANSI"
arch=('x86_64' 'aarch64')
url="https://github.com/Hibryda/gnfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
# makepkg's default LTO injects -flto into CFLAGS, which makes ring's build
# script emit LTO objects (no real symbols) -> undefined ring_core_* at link.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e5644abdbe4d68f3f5f4fa29a77cdfc7085afce0fcedd306e0bb63b1e6c90d6')

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
    cargo test --frozen --release
}
package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
}
