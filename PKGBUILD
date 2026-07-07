# Maintainer: wanger <310779211wym@gmail.com>
pkgname=mineral
pkgver=0.5.3
pkgrel=1
pkgdesc="A multi-source TUI music player in Rust — ratatui frontend, pluggable channel backends, real streaming playback with lyrics & spectrum."
arch=('x86_64')
url="https://github.com/10knamesmore/Mineral"
license=('MIT')
options=(!lto !debug)
depends=('alsa-lib' 'openssl' 'zlib' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68b6ee7e3fb72362f554ea031f9b1daa07c7d91a0c2b6016aa5a9998823de385')

prepare() {
    cd "Mineral-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Mineral-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package mineral
}

package() {
    cd "Mineral-$pkgver"
    install -Dm755 "target/release/mineral" "$pkgdir/usr/bin/mineral"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
