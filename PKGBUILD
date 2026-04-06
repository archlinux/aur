# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-lua
pkgver=1.1.3
pkgrel=1
pkgdesc="Lua scripting runtime for Owlry — enables user-created Lua plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-lua-v$pkgver.tar.gz")
b2sums=('648171ce688761babb7ada9ec96cb248fab5563cc45599f660f21e166bfb4db689cff22b82f3a1f2ae256dd54fb3d3f4d5a8acaf6a728976d42ee511e1f25e5f')

_cratename=owlry-lua

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
    cargo test -p $_cratename --frozen --lib
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/runtimes/liblua.so"
}
