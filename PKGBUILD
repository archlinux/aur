# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.7.0
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
b2sums=('d7b344782e42d3e2743f19fbc5b5806f5c1fab8ea7568b7634f3e022ccd1a9c74e40b5b6703b8b43d39358a07ae762e287a29322a2d05dac8b6577705ddb2503')

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
