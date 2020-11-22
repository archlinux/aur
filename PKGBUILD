# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.5.1
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/archive/$pkgver.tar.gz")
license=('MIT')
sha512sums=('e677b31f1a80c4232435f0a1c832a63037f35ba7e7c3eab1f7cf63bf68e3d4661b25558042536068b5b7d0068acc5ca419ab3439fe16825ddf38f9a7e8061fa4')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

check() {
    cd $pkgname-$pkgver
    CARGO_HUSKY_DONT_INSTALL_HOOKS=true cargo test --release --locked
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