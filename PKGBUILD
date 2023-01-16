# Maintainer: seiuneko <chfsefefgesfen foxmail>
pkgname=dufs-git
_pkgname=dufs
pkgver=0.31.0.r5.gb6d5551
pkgrel=1
pkgdesc="A file server that supports static serving, uploading, searching, accessing control, webdav..."
arch=('x86_64')
url="https://github.com/sigoden/dufs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("git+https://github.com/sigoden/dufs.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"

    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
