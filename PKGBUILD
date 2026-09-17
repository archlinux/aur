# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.6.0
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, pdf, and image files (OCR) -- renders to markdown with bat'
arch=('x86_64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# Disable makepkg's -flto=auto injection: ring's C objects become GCC LTO
# bitcode that rust-lld cannot link (undefined ring_core_* symbols).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('78fa6ac57722723ffb31ca555ec10ccc4b8790157c3b1ef0c9fc88996c87eae6a1a3bc5a3783d863e46709994453332d3fe437d51c2d81d46ad7dffd6f637496')

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
