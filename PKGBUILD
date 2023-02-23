# Maintainer: Jérémie Roquet <jroquet@arkanosis.net>
pkgname=bamrescue
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility to check Binary Sequence Alignment / Map (BAM) files for corruption and repair them"
arch=("x86_64")
url="https://bamrescue.arkanosis.net/"
license=("custom:ISC")
makedepends=("cargo" "git" "ruby-ronn")
checkdepends=("cargo")
source=("git+https://github.com/arkanosis/${pkgname}?signed#tag=v$pkgver")
sha512sums=('SKIP')
validpgpkeys=("FA490B15D054C7E83F70B0408C145ABAC11FA702")

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    ronn < "$srcdir/$pkgname/docs/man/$pkgname.1.ronn" | gzip -9 > "$srcdir/$pkgname/docs/man/$pkgname.1.gz"
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "docs/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
    install -Dm0644 "completion/bash/$pkgname" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm0644 "completion/zsh/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
