# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-weather
pkgver=0.2.2
pkgrel=1
_srcver=0.4.1
pkgdesc="Weather widget plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
source=("owlry-$_srcver.tar.gz::$url/archive/v$_srcver.tar.gz")
b2sums=('b685dae422b9c53c57dee34100209fd1df0ac082aaaf5456a1e80631f4a85440b34a1891a10ac849a15345a37ec18aa97b01dd54ab2456765a8dd3ccffccf059')

_cratename=owlry-plugin-weather

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p $_cratename --frozen --release
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p $_cratename --frozen
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/plugins/libweather.so"
}
