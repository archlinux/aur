# Maintainer: sinder <smirnov.sinder@gmail.com>
pkgname=live-paper
pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland video wallpaper engine"
arch=('x86_64')
url="https://github.com/sinder38/live-paper-rs"
license=('MIT')
depends=('mpv' 'wayland' 'libglvnd')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-rs-$pkgver"

    install -Dm755 "target/release/live-paper" "$pkgdir/usr/bin/live-paper"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Ship the sample config as documentation
    install -Dm644 "config.example.toml" \
        "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
