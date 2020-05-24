# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tin-summer
pkgver=1.21.8
pkgrel=3
pkgdesc='Find build artifacts that are taking up disk space'
arch=('x86_64')
url="https://github.com/vmchale/$pkgname"
license=('BSD')
makedepends=('rust')
conflicts=('mono')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d9a6f4b41c759c291c91348914635243df0f13d38985d398bbb48a39ab4b338c')
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
