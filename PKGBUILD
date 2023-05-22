# Maintainer: acuteenvy
pkgname=tldrtool
pkgver=1.0.1
pkgrel=2
pkgdesc="Automate contributing to tldr"
arch=('x86_64')
url="https://github.com/acuteenvy/$pkgname"
license=('MIT')
makedepends=('cargo')
depends=('git')
optdepends=(
    'tldr: view pages using a client'
    'xdg-utils: open a browser to create pull requests'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4ce7ece2323d433e051f89a40bef20d7ba366517be3d5bcd1cad7dada1c0da4c37e0880acf58df99098f28e11a1b9ba9549b1644ae0cece456cc6b598bbf6543')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/tlt" -t "$pkgdir/usr/bin"
    install -Dm644 tlt.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
