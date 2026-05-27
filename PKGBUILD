# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=matchmaker
pkgver=0.0.38
pkgrel=1
pkgdesc='A fast, configurable and intuitive fuzzy searcher.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/Squirreljetpack/matchmaker'
license=('AGPL-3.0')
makedepends=('cargo')
options=(!lto)
provides=('mm')
conflicts=('matchmaker-git' 'matchmaker-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b3966ed58f8bfe44725fb92ce82a46b06ea3fe324c9eb4e11b47c721535b1a77')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 'target/release/mm' "$pkgdir/usr/bin/mm"
    install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions" matchmaker-cli/assets/completions/mm.bash
    install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" matchmaker-cli/assets/completions/_mm
    install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" matchmaker-cli/assets/completions/mm.fish
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" matchmaker-cli/LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" matchmaker-cli/README.md
}

# vim: ts=4 sw=4 et:
