# Maintainer: Dylan <dylanh@aur.archlinux.org>
pkgname=rune-editor
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
arch=('x86_64')
url="https://github.com/exec/rune"
license=('MIT')
depends=('oniguruma' 'glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'pkgconf')
provides=('rune')
conflicts=('rune-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/exec/rune/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6a45d336a6f8c9c9abbc9b294c5e653e1fcb2082cc4909c313595a0847bc7a0')

build() {
    cd "rune-$pkgver"
    export PKG_CONFIG_PATH=/usr/lib/pkgconfig
    export ONIG_LIB_DIR=/usr/lib
    export ONIG_INCLUDE_DIR=/usr/include
    export RUSTFLAGS="-L /usr/lib -l onig"
    cargo build --release --locked
}

check() {
    cd "rune-$pkgver"
    cargo test --release --locked
}

package() {
    cd "rune-$pkgver"
    install -Dm755 target/release/rune "$pkgdir/usr/bin/rune"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}