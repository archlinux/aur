# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.5.6
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/archive/$pkgver.tar.gz")
license=('MIT')
sha512sums=('933e3fb6f85ed10ad24f82c76ee78bf64be50792b09ec73a77babf155f50932b0548a6a8ce14883cf40a3f17fa0ce0e0622956a374bdb71a4cb917b2deab9867')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked --no-default-features
}

check() {
    cd $pkgname-$pkgver
    CARGO_HUSKY_DONT_INSTALL_HOOKS=true cargo test --release --locked --no-default-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/btm "$pkgdir/usr/bin/btm"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    local target_dir=$(ls target/release/build/bottom-*/out/btm.bash | head -n1 | xargs dirname)
    install -Dm644 "$target_dir"/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 "$target_dir"/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 "$target_dir"/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}