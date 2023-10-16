# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>
# Contributor: Mike Yuan <me@yhndnzj.com>

pkgname=ast-grep
pkgver=0.12.5
pkgrel=1
pkgdesc='A fast and polyglot tool for code structural search, lint, rewriting at large scale'
arch=('x86_64')
url='https://ast-grep.github.io/'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ast-grep/ast-grep/archive/$pkgver.tar.gz")
sha256sums=('39c54c1f809340c6f2e9b8f1e941619ec161b076e2114f0140a8e5825259048d')
b2sums=('2cc2b5099669b7161c895b4e8e92de952fae3cbfd30cb8380f8fdfab5176ceebf63d1f981fc1b08bf65b16040da980d25d59b6b32b749160355eb31f32855377')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    CARGO_TARGET_DIR=target \
    cargo build --frozen --release --all-features --package ast-grep
}

check() {
    cd "$pkgname-$pkgver"

    RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin" \
        target/release/ast-grep
    ln -sf ast-grep "$pkgdir/usr/bin/asg"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        LICENSE
}
