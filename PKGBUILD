# Maintainer: Randal <three-dim-sky@foxmail.com>
pkgname=dagtoc
pkgver=4.0.1
pkgrel=1
pkgdesc="A CLI tool for operating pdf contents"
arch=('x86_64')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
conflicts=('dagtoc-bin')
depends=('python-pymupdf')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a88996f0d50cf42bf9892e8fec7f16f3485cf714f609dc318a954a1a1a1891a3')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
	cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/$pkgname.nu" -t "$pkgdir/usr/share/nushell/completions"

    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
