# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-weather
pkgver=1.0.3
pkgrel=1
pkgdesc="Weather widget for Owlry — display current weather conditions"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'openssl')
makedepends=('cargo')
install=owlry-plugin-weather.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('a0988b7eb5496a1b9f0f5a9936b84990c79736b66da26de06e63d542bf4b0d9e2a382e0257c3237f67fdd41a278d0a8a38e683361f50cb0dcf0c6afe8d6ac7cd')

_cratename=owlry-plugin-weather

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
