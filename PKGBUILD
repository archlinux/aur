# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.6.3
pkgrel=1
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/archive/$pkgver.tar.gz")
license=('MIT')
sha512sums=('1c27a3b2cc264879b669517ab6e67748b7ce6db5d07850aea829ae4c6be86bfce1ca718d6af0cd556d5d9196643b4df98186515212571f72f043ac91b2211780')

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