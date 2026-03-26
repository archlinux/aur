# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-converter
pkgver=1.0.0
pkgrel=1
pkgdesc="Unit and currency conversion plugin for Owlry — convert temperature, weight, length, currency, and more"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
install=owlry-plugin-converter.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('29fc423aa2da96fab88de0d5f4048f6a4571931f411d634b37b829bf8fcd7f32bc23b0b8f634f40a129f44d8077b2f3e33c98f4fad7838a48aa39d4b1acfa2f6')

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
