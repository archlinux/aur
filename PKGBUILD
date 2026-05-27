pkgname=sparkplayer
pkgver=0.6.0
pkgrel=1
pkgdesc="A fun, no-nonsense terminal media player built with ratatui"
arch=('x86_64')
url="https://github.com/dividebysandwich/sparkplayer"
license=('GPL-2.0-only')
depends=('alsa-lib' 'gcc-libs' 'ffmpeg' 'sdl2' 'ttf-dejavu')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eba02dda2a440d7d46b53aadc12b46c45de65971dcf129c025dc4eebe0ef2f0a')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
