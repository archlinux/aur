# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tin-summer
pkgver=1.21.14
pkgrel=1
pkgdesc='Find build artifacts that are taking up disk space'
arch=('x86_64')
url="https://github.com/vmchale/$pkgname"
license=('BSD')
makedepends=('rust')
conflicts=('mono')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8a4883b7a6354c6340e73a87d1009c0cc79bdfa135fe947317705dad9f0a6727')
_binname=sn

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p ./target/release/completions
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    export BASH_COMPLETIONS_DIR="./target/release/completions"
    export FISH_COMPLETIONS_DIR="./target/release/completions"
    cargo build --release --locked --features bash,fish
    mv ./target/release/completions/$_binname{.bash,}
}

check() {
    cd "$pkgname-$pkgver"
    cargo check --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
    install -Dm664 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" target/release/completions/$_binname
    install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" target/release/completions/$_binname.fish
}
