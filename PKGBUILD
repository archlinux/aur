# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc
pkgver=1.3.1
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, and pdf -- renders to markdown with bat'
arch=('x86_64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9489e318e53b57d101b38873a02aa06bf75d5f372b4ee10d38ab827a7d4900997b005af3e9498c4cf7636856f8e78e5c9c39ae0db923724a48e3b0c99d5cb59a')

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
