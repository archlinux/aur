# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-lua
pkgver=1.1.2
pkgrel=1
pkgdesc="Lua scripting runtime for Owlry — enables user-created Lua plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-lua-v$pkgver.tar.gz")
b2sums=('42e6221e6e07c629ece1493e7f5feb1b2cb2e77632d1d7779dfbe544bd89a17d77d1839d63e50d71d4f0e0322ca8a1cc39b872101039019bdf08d9bcaeda7603')

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
