# Maintainer: enos muthiani @lyznne <emuthiani26@gmail.com>
pkgname=peek-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple file viewer that opens files in the default web browser."
arch=('x86_64')
url="https://github.com/lyznne/peek"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'rust' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/lyznne/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname-$pkgver" || return
    # Example output: 0.1.0.r3.gabcdef
    git describe --tags --match 'v[0-9]*' --abbrev=7 | sed 's/^v//; s/-/./g'
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install shell completions
    install -Dm644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
