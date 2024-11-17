# Maintainer: Gergő Sályi <salyigergo94@gmail.com>
pkgname=multibg-sway
pkgver=0.1.10
pkgrel=1
pkgdesc='Set a different wallpaper for the background of each Sway workspace'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/gergo-salyi/multibg-sway"
license=('MIT' 'Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('sway: window manager to set the wallpapers with')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('2b087124ea07635e53d411e707f7d22f73c69b40f3986a42c841f9cc19fc2d51')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
