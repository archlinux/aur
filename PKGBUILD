# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.6.2
pkgrel=1
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/archive/$pkgver.tar.gz")
license=('MIT')
sha512sums=('c5bf95bfa6e5f20997b15f6a9ab977652bf144269b6984f6594893eb406e174992d1654f2bd1bfa62f7f4acae23d9d09fead42acd291108d24c5049cf401cfb5')

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