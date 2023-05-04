# Maintainer: acuteenvy
pkgname=tldrtool
pkgver=1.0.0
pkgrel=1
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
b2sums=('e326eccca8a4b6a5dac8a141ccd2757c78961a45f9238827d257625198a7a733bb48cc4775e020da94305ecd1022297d5a47807c40f6c7cf7dbe3187b073bf8e')

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
