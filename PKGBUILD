# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tusic
pkgver=0.1.3
pkgrel=1
pkgdesc='Lightweight TUI Music Player. Play from YouTube or ~/Music folder easily.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/eminfedar/tusic'
license=('MIT')
depends=('yt-dlp')
makedepends=(
    'cargo'
    'patch'
)
options=(
    !debug
    !lto
)
provides=('tusic')
conflicts=('tusic-git' 'tusic-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    '0001-use-yt-dlp-from-system.patch'
)
sha256sums=(
    'fc11e5605e51007a6e578b50d72a0610af08d93fea5f7806a7aa9736cbf8f94e'
    'a5d50a8f71978732320819126fc745c296c04c6c2721b79c931e3e1d25f35df5'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../0001-use-yt-dlp-from-system.patch
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
    install -Dm0755 target/release/tusic "$pkgdir/usr/bin/tusic"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
