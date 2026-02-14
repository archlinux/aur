# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.3.0
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, and pdf -- renders to markdown with bat'
arch=('x86_64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('81c36c268490de5b98467621fa8365e2dfaff9adb10b73f8e8e6be45731a4e0ad32cd39a5094b4b73a4250e88dc583026d63d27b7c2f326b8a2817933abb5cfa')

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
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
