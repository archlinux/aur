# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-converter
pkgver=1.0.2
pkgrel=1
pkgdesc="Unit and currency conversion plugin for Owlry — convert temperature, weight, length, currency, and more"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
install=owlry-plugin-converter.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('a89bff286559b1e9984545bf8655c0d7230f0cd139134498041fad71ac90e144c52b550b5d9540a8458c96f1fb05b23aa28e557d1bb0d6a08ee46563ae6da188')

_cratename=owlry-plugin-converter

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
