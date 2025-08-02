# Maintainer: Dylan <dylanh@aur.archlinux.org>
pkgname=rune-editor
pkgver=1.2.0
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
sha256sums=('8a41cfca99e41e3f8903e2790a670d50c263775ea191291282d626c3e14c9bfe')

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