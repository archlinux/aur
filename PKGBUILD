# Maintainer: guitaripod <guitaripod@icloud.com>
pkgname=imago
pkgver=0.1.4
pkgrel=1
pkgdesc='Agent-native Instagram profile archive - every photo, video, and carousel slide'
arch=('x86_64')
url='https://github.com/guitaripod/imago'
license=('MIT')
depends=('curl' 'glibc' 'libgcc')
makedepends=('cargo')
# rusqlite bundles SQLite: GCC's LTO objects are unreadable by rust-lld.
# The release profile already strips, so there are no debug symbols to split.
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/guitaripod/imago/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('594a6a88a48709b68bbc4669181533f29a88416106ca76f144c3ce3ad95ee6d4')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/imago" "$pkgdir/usr/bin/imago"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/imago/LICENSE"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/imago/README.md"
}
