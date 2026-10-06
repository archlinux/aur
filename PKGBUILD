# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.7.1
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
b2sums=('bcaa85d9d998e596fc8558393efcd2ffe0d4240eab8a61a172c407aede70df104d3a17060a0b130196ec0c56f47a26bd0b901f44119a65c4fe16841c6e5f53e9')

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
