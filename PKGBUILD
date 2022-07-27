# Maintainer: somini <dev@somini.xyz>
pkgname=pw-volume
pkgver=0.4.0
pkgrel=2
pkgdesc="Basic interface to PipeWire volume controls"
arch=("x86_64")
url="https://github.com/smasher164/pw-volume"
license=('MIT')
depends=('pipewire')
makedepends=('cargo')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/smasher164/pw-volume/commit/f4eff8c13cbe62744064d636eb4045a347695e15.patch"
)
sha256sums=('402122ef612cc8b88ca9d73bda0ecba8f2474f18270c19ce1b51aadb81c800de'
            '82cb1170aa6ac5202f5beda427320047fb28210df183a2c367b39e5ddb38ba56')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 <"$srcdir/f4eff8c13cbe62744064d636eb4045a347695e15.patch"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
