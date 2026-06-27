# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tusic
pkgver=0.1.4
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
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.t.tar.gz"
    '0001-use-yt-dlp-from-system.patch'
)
sha256sums=(
    '41ca910f1726d8d18c6f987f2a53b327fceacf7144de754d2d210815620404c3'
    '8c3fee907104af4cebc8df0dacb99f5a903f879d3df72bc11617eecc1e3fb60e'
)

prepare() {
    cd "$pkgname-$pkgver.t"
    patch -p1 < ../0001-use-yt-dlp-from-system.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver.t"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver.t"
    install -Dm0755 target/release/tusic "$pkgdir/usr/bin/tusic"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
