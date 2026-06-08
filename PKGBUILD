# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hygg
pkgver=0.1.21
pkgrel=1
pkgdesc='Minimalistic Vim-like TUI document reader.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/kruseio/hygg'
license=('AGPL-3.0')
makedepends=('cargo') # 'clang' 'gcc-libs')
options=(
    !lto
    !debug
)
provides=(
    'hygg'
    'cli-epub-to-text'
    'cli-justify'
    'cli-pdf-to-text'
    'cli-text-reader'
)
conflicts=($pkgname-git $pkgname-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c0f3005bf97940881d695b7e8bde55318daf4de48c927cb4a9150d3b86ccb181')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    for bin in "${provides[@]}"; do
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$bin"
    done
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
