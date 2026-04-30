# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.4.0
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, and pdf -- renders to markdown with bat'
arch=('x86_64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9012a54b4ff960f7f0be2c48006ffb8699e45901120a4de7516a5f1f0345074e7cd577d5b09a4c8b00af7f42b229aa5c9a0c7d08a5198a0e876de583fc4c339b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 target/man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
