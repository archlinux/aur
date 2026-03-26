# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-calculator
pkgver=1.0.0
pkgrel=1
pkgdesc="Calculator plugin for Owlry — evaluate math expressions inline"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
install=owlry-plugin-calculator.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('3d9a096485d5dea487a69fd48019eb5cddf2781bda5acce0503ecc5f19412f274b3a6f60a1922c35bd7855e4f72eaacb131d8affd0ee21d00e213345134a1b98')

_cratename=owlry-plugin-calculator

prepare() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p $_cratename --frozen --release
}

check() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p $_cratename --frozen
}

package() {
    cd "owlry-plugins"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/plugins/lib${_cratename//-/_}.so"
}
