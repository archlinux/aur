# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-lua
pkgver=1.1.0
pkgrel=1
pkgdesc="Lua scripting runtime for Owlry — enables user-created Lua plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-lua-v$pkgver.tar.gz")
b2sums=('d4b200446a31301b1240fd8eede6e10764d7bbc551f2e5549bfdbdcc0fa4a717677c3c2c69778d2dfa336711ac5b74d4987e46082ea589fed961c9d2ff95af76')

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
    cargo test -p $_cratename --frozen --release
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/runtimes/liblua.so"
}
